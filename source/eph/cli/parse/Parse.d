module eph.cli.parse.parser;

import eph.cli.parameter: Parameter;
import eph.cli.flag: Flag;
import eph.cli.com.command: Command;

private const char FLAG_MARKER = '-';

private enum State {
  SEEK,
  DONE,

  NON_FLAG,
  FLAG,

  SEEK_REQ_PARAM,
  SEEK_OPT_PARAM
}

public class Parser {
  private Flag!void[char]   shortFlags;
  private Flag!void[string] longFlags;
  private Parameter!void[] parameters;
  private Command[string] commands;
  private string[] unrecognized;
  private State state;
  private Command[] hits;
  private int index;

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
          break;
        default:
          throw new Exception("Invalid parser state");
      }
    }
  }

  private void seek(const char c) {
    this.state = c == FLAG_MARKER
      ? State.FLAG
      : State.NON_FLAG;
  }

  private void flag(const string s) {
    this.index++;
    if(s.length == 1) {
      this.unrecognized ~= s;
    }

    if (s[1] == FLAG_MARKER) {
      if (s.length == 2) {
        this.state = State.DONE;
        return;
      }
      this.longFlag(s);
    }

    for(int i = 1; i < s.length; i++) {}
  }

  private void longFlag(const string name) {
    Flag!void* flag = (name[2..$] in this.longFlags);
    if (flag is null) {
      this.unrecognized ~= name;
      this.state = State.SEEK;
      return;
    }

    flag.markUsed();

    if (!flag.expectsValue()) {
      return;
    }

    this.state = flag.requiresValue()
      ? State.SEEK_REQ_PARAM
      : State.SEEK_OPT_PARAM;
  }

  private void shortFlag(const char val) {

  }

  private void shiftCommands(Command com) {
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

  private void appendShortFlag(Flag!void f) {
    if(!f.hasShortFlag())
      return;

    const char c = f.getShortFlag();
    if(c in this.shortFlags) {
      throw new Exception("Conflicting short flag " ~ c);
    }

    this.shortFlags[c] = f;
  }

  private void appendLongFlag(Flag!void f) {
    if(!f.hasLongFlag())
      return;

    const string s = f.getLongFlag();
    if(s in this.longFlags)
      throw new Exception("Conflicting long flag " ~ s);

    this.longFlags[s] = f;
  }
}
