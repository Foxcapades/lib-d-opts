module eph.cli.parse.parser;

import std.string;
import std.range;

import eph.cli.parameter: Parameter;
import eph.cli.flag;
import eph.cli.com.command: Command;

private const char FLAG_MARKER = '-';
private const char VALUE_DIVIDER = '=';

private enum State {
  SEEK,
  DONE,

  NON_FLAG,
  FLAG,
  FLAG_LONG,
  FLAG_SHORT,

  SEEK_REQ_PARAM,
  SEEK_OPT_PARAM
}

/**
 * CLI Input parser
 */
public class Parser {

  private CollectibleFlag[char] shortFlags;

  private CollectibleFlag[string] longFlags;

  private Parameter!void[] parameters;

  private Command[string] commands;

  private string[] unrecognized;

  private State state;

  private Command[] hits;

  private int index;

  /**
   * @param com Command tree root node.
   */
  public this(Command com) {
    this.hits ~= com;
    this.shiftCommands(com);
  }

  // 1 read flags, params, subcommands from root command
  // 2 match flags & params until subcommand is encountered
  // 3 append flags & params from matched subcommand, replace sub command with subcommand's subcommands
  // 4 go back to 2 and repeat until -- is encountered or no more strings are left

  public void parse(const string[] args) {
    this.index = 0;

    while(this.index < args.length) {
      switch(state) {

        case State.SEEK:
          seek(args[this.index][0]);
          break;

        case State.FLAG:
          flag(args[this.index]);
          break;

        case State.FLAG_LONG:
          longFlag(args[this.index]);
          this.index++;
          break;
        
        case State.FLAG_SHORT:
          shortFlag(args[this.index]);
          this.index++;
          break;

        default:
          throw new Exception("Invalid parser state");
      }
    }
  }

  /**
   * Determines whether or not the given character is a the
   * marker for the start of a CLI flag then updates the
   * parser state accordingly.
   *
   * Does not increment arg index.
   *
   * Params:
   *   c   = first character of an input string.
   */
  private void seek(const char c) {
    this.state = c == FLAG_MARKER
      ? State.FLAG
      : State.NON_FLAG;
  }

  /**
   * flag determines if the input string is a short flag,
   * a long flag, or the end flag string (`--`).
   *
   * Does not increment arg index.
   */
  private void flag(const string s)
  in {
    assert(s.length > 0);
    assert(this.state == State.FLAG);
  }
  do {
    this.index++;
    if(s.length == 1)
      this.unrecognized ~= s;

    if (s[1] != FLAG_MARKER) {
      this.state = State.FLAG_SHORT;
      return;
    }

    this.state = s.length == 2
      ? State.DONE
      : State.FLAG_LONG;
  }

  /**
   * longFlag parses the given longFlag
   */
  private void longFlag(const string raw)
  in {
    assert(raw.length > 2);
    assert(this.state == State.FLAG_LONG);
  }
  do {
    const auto   dp = dividerPosition(raw);
    const auto  end = dp == -1 ? raw.length - 1 : cast(ulong) dp;
    const auto name = raw[2..end];
    auto flag = (name in this.longFlags);

    // If we don't error then we are done with this flag and
    // can return to the base discovery state.
    this.state = State.SEEK;

    // The current flag is not one registered with the
    // parser sort it into unrecognized inputs and continue
    // to the next arg.
    if (flag is null) {
      this.unrecognized ~= raw;
      return;
    }

    // Flag was found, set the usage indicator.
    flag.markUsed();

    // TODO: Maybe record an error if a value was provided
    //       for this flag when it doesn't expect one.
    if (!flag.expectsValue())
      return;

    // If the input had no value, or the last character was
    // the divider.
    if (dp == -1 || dp + 1 == raw.length) {
      if (flag.requiresValue())
        // TODO: this should be a recorded error.  The lib
        //       consumer should be able to decide whether
        //       or not this is an exception case.
        throw new Exception("Flag " ~ name ~ " requires a value.");
      // Nothing left to do
      return;
    }

    // Append everything after the divider position (dp) as
    // this flag's value
    flag.appendValue(raw[dp+1..$]);
  }

  private void shortFlag(const string raw) {
    state = SFS(raw, shortFlags, unrecognized)
      .parse();
  }

  /**
   * Shifts the current focused command from the previous
   * command (if any) to the given input Command.
   *
   * Once registered, any flags or parameters for the new
   * command will be added to the list of possible parse
   * targets.
   *
   * Params:
   *   com = New target command
   */
  private void shiftCommands(Command com)
  in(com !is null)
  {
    foreach(Flag!void f; com.mutFlags()) {
      this.appendShortFlag(f);
      this.appendLongFlag(f);
    }

    foreach(Parameter!void p; com.mutParameters())
      this.parameters ~= p;

    commands.clear();
    foreach(Command c; com.mutSubCommands())
      this.commands[c.getName()] = c;
  }

  /**
   * Appends the given flag to the list of possible short
   * flags if the given flag has a short (single character)
   * form, else does nothing.
   *
   * Params:
   *   f   = flag to append (if it has a short form)
   *
   * Throws:
   *   Exception if more than one flag was found with the
   *   same short name.
   */
  private void appendShortFlag(Flag!void f)
  in(f !is null)
  {
    if(!f.hasShortFlag())
      return;

    const char c = f.getShortFlag();
    if(c in this.shortFlags)
      throw new Exception("Conflicting short flag " ~ c);

    this.shortFlags[c] = f;
  }

  /**
   * Appends the given flag to the list of possible long
   * flags if the given flag has a long form, else does
   * nothing.
   *
   * Params:
   *   f   = flag to append (if it has a long form)
   *
   * Throws:
   *   Exception if more than one flag was found with the
   *   same long name.
   */
  private void appendLongFlag(Flag!void f)
  in(f !is null)
  {
    if(!f.hasLongFlag())
      return;

    const string s = f.getLongFlag();
    if(s in this.longFlags)
      throw new Exception("Conflicting long flag " ~ s);

    this.longFlags[s] = f;
  }
}

private pure long dividerPosition(scope const ref string val)
in(val !is null) { return val.indexOf(VALUE_DIVIDER); }

private struct SFS
{
  private char last, next, curr;
  private CollectibleFlag flag;
  private ulong pos;
  private const string raw;
  private State outState;
  private string[] unknown;
  private CollectibleFlag[char] flags;

  this(const string raw, CollectibleFlag[char] flags, string[] unknown)
  in(raw.length > 2)
  {
    this.flags = flags;
    this.unknown = unknown;
    this.raw = raw;
    this.pos = 1;
  }

  public State parse()
  out(o; o !is null)
  {
    next = raw[pos];
    while (pos < raw.length) {
      last = curr;
      curr = next;
      next = ++pos == raw.length ? 0 : raw[pos];

      isCurrFlag;
    }

    return outState;
  }

  private void end()
  { this.pos = this.raw.length; }

  private string remainder(const uint i = 0)
  { return raw[pos+i..$]; }

  private void currUnknown()
  { return unknown ~= "-" ~ curr; }

  /**
   * is curr a flag?
   */
  private void isCurrFlag()
  {
    auto f = (curr in flags);
    if (f is null) {
      isCurrEq;
    } else {
      flag = f;
      flag.markUsed;
      doesCurrFlagRequireInput;
    }
  }

  /**
   * curr is a flag:
   *   does curr flag require input?
   */
  private void doesCurrFlagRequireInput()
  {
    if (flag.requiresValue) {
      isEndingOnRequired;
    } else {
      doesCurrFlagExpectInput;
    }
  }

  /**
   * curr is a flag:
   *   curr flag requires input:
   *     are we ending on this flag?
   */
  private void isEndingOnRequired()
  {
    if (pos < raw.length)
      isNextEq;
  }

  /**
   * curr is a flag:
   *   curr flag does not require input:
   *     does current flag expect input?
   */
  private void doesCurrFlagExpectInput()
  {
    if (flag.expectsValue)
      isEndingOnExpected;
  }

  /**
   * curr is a flag:
   *   curr flag does not require input:
   *     flag expects value:
   *       are we at the end of this chunk?
   */
  private void isEndingOnExpected()
  {
    if (pos == raw.length)
      outState = State.SEEK_OPT_PARAM;
  }

  /**
   * curr is a flag:
   *   curr flag requires input:
   *     we are not at the end of the string:
   *       is the next character '='?
   */
  private void isNextEq()
  {
    const auto n = next == VALUE_DIVIDER ? 1 : 0;
    flag.appendValue(remainder(n));
    outState = State.SEEK;
  }

  /**
   * curr is not flag:
   *   is curr "="?
   */
  private void isCurrEq()
  {
    if (curr == VALUE_DIVIDER)
      wasLastNullCE;
    else
      wasLastNullNCE;
  }

  /**
   * curr is not flag:
   *   curr is "=":
   *     was last flag null?
   */
  private void wasLastNullCE()
  {
    if (flag is null)
      wasLastCharNull;
    else
      doesLastExpectValue;
  }

  /**
   * curr is not flag:
   *   curr is "=":
   *     last flag was null:
   *       was last char null?
   */
  private void wasLastCharNull()
  {
    if (last == 0) {
      currUnknown;
    } else {
      unknown ~= "-" ~ last ~ '=' ~ remainder;
      end;
    }
  }

  /**
   * curr is not flag:
   *   curr is "=":
   *     last flag was not null:
   *       does last flag expect a value?
   */
  private void doesLastExpectValue()
  {
    if (flag.expectsValue) {
      flag.appendValue(remainder);
      end;
    } else {
      currUnknown;
    }
  }

  /**
   * curr is not flag:
   *   curr is not "=":
   *     was last flag null?
   */
  private void wasLastNullNCE()
  {
    // TODO
    if (flag is null) {
      currUnknown;
    } else {
      doesLastExpectValue;
    }
  }
}