module eph.args.parse;

import eph.args.arg: Argument;
import eph.args.param: Parameter;
import eph.args.err;
import std.string: indexOf;

import std.stdio;


private const ubyte DASH   = 45;
private const ubyte EQUALS = 61;

private enum State {
  // In between cli inputs (not sure what is next)
  SEEK,

  // A single "-" character has been seen, not yet sure if long or short flag
  FLAG_START,

  // Found "--" followed by a non-space character
  IN_LONG,

  // Found non-dash starting character
  IN_PARAM,

  // Found single dash followed by non-dash, non-space character
  IN_SHORT,

  // Found a short flag seeking a possible flag value
  SEEK_OPT_PARAM,

  // Found a short flag seeking a mandatory flag value
  SEEK_REQ_PARAM,

  // "-- " has been encountered, stop parsing flags
  DONE
}

/**
 * Argument Parser
 */
public class ArgParser {
  private Argument[char] byShort;
  private Argument[string] byLong;
  private Parameter[] params;

  private ubyte paramIndex;
  private string[] unknown;
  private State state;
  private string[] after;

  private Argument lastArg;

  private ulong strPos;

  this() {}

  /**
   * Register arguments with this parser instance.
   * Returns the current ArgParser instance.
   */
  public ArgParser register(Argument[] opts...) {
    for(int i; i < opts.length; i++) {
      const char c = opts[i].shortFlag();
      if(c != 0) {
        byShort[c] = opts[i];
      }

      const string l = opts[i].longFlag();
      if (l !is null && l.length > 0) {
        byLong[l] = opts[i];
      }
    }

    return this;
  }

  /**
   * Register parameters with this parser instance.
   * Returns the current ArgParser instance.
   */
  public ArgParser register(Parameter[] params...) {
    this.params ~= params;
    return this;
  }

  /**
   * Parse the command input string.
   */
  public void parse(const string[] args) {
    debug(dOpts) printDebug(__FUNCTION__, args);
    for(int i = 1; i < args.length; i++) {
      strPos = 0uL;
      if (state == State.DONE) {
        after ~= args[i];
      } else {
        parse(args[i]);
      }
    }
  }

  /**
   * Parse state handler method
   */
  private void parse(const string arg) {
    debug(dOpts) printDebug(__FUNCTION__, arg);
    while(strPos < arg.length) {
      switch(this.state) {
        case State.SEEK:
          this.seek(arg[strPos]);
          break;

        case State.FLAG_START:
          this.flagStart(arg[strPos], arg);
          break;

        case State.IN_PARAM:
          this.inParam(arg);
          break;

        case State.IN_LONG:
          this.inLong(arg);
          break;

        case State.IN_SHORT:
          this.inShort(arg[strPos], arg);
          break;

        case State.SEEK_OPT_PARAM:
          this.seekOptParam(arg[strPos], arg);
          break;

        case State.SEEK_REQ_PARAM:
          this.seekReqParam(arg[strPos], arg);
          break;

        default:
          throw new Exception("illegal parser state");
      }
    }
  }

  /**
   * Returns all parameters encountered in the command call
   * that were not recognized by the parser.
   */
  public string[] remainder() {
    return unknown;
  }

  /**
   * Returns all values passed to the command call after the
   * appearance of "--" unchanged.
   */
  public string[] passthrough() {
    return after;
  }

  /**
   * Seek state handler method
   */
  private void seek(const char c) {
    debug(dOpts) printDebug(__FUNCTION__, "" ~ c);
    switch(c) {

      case DASH:
        this.state = State.FLAG_START;
        strPos++;
        break;

      default:
        this.state = State.IN_PARAM;

    }
  }

  /**
   * Flag start state handler method
   */
  private void flagStart(const char c, const string raw) {
    debug(dOpts) printDebug(__FUNCTION__, "" ~ c, raw);
    if(isDash(c)) {
      strPos++;
      if(strPos == raw.length) {
        state = State.DONE;
      } else {
        state = State.IN_LONG;
      }
      return;
    }

    state = State.IN_SHORT;
  }

  /**
   * In param state handler method
   */
  private void inParam(const string raw) {
    debug(dOpts) printDebug(__FUNCTION__, raw);

    if (paramIndex >= params.length) {
      unknown ~= raw;
    } else {
      params[paramIndex].value(raw);
      params[paramIndex].setWasSet(true);
      paramIndex++;
    }

    strPos = raw.length;
    state = State.SEEK;
  }

  /**
   * In short flag state handler method
   */
  private void inShort(const char c, const string raw) {
    debug(dOpts) printDebug(__FUNCTION__, ""~c, raw);

    if(!exists(c)) {
      throw new UnknownFlagException(c);
    }

    Argument o = byShort[c];

    o.use();
    strPos++;

    // If the arg does not take parameters, return now without changing the
    // state so that this method will be called again to parse the next arg.
    // use case: "foo -abc" where a, b, and c are separate args.
    if(!o.parameterized()) {

      // If we have reached the end of this string block then return to seek
      // mode.
      if(strPos == raw.length)
        state = State.SEEK;

      return;
    }

    // If the position has been moved past the end of the input string then
    // there is nothing left to process and this is a singular flag expecting
    // one or more spaces followed by the param value: "foo -f someVal".
    if(strPos == raw.length) {
      lastArg = o;
      state = o.paramRequired()
        ? State.SEEK_REQ_PARAM
        : State.SEEK_OPT_PARAM;
      return;
    }

    // If this is reached, then the arg is expecting a param, and there is more
    // to the string, which either means user error or the arg param value was
    // provided without a space: foo -Fvalue
    o.value(raw[strPos..$]);
    strPos = raw.length;
    state = State.SEEK;
  }

  private void inLong(const string raw) {
    debug(dOpts) printDebug(__FUNCTION__, raw);
    const int  ind      = cast(int) raw.indexOf(EQUALS);
    const bool hasValue = ind > -1;

    string name;
    string value;

    strPos = raw.length;
    state  = State.SEEK;

    if (!hasValue) {
      name = raw[2..$];
    } else {
      name  = raw[2..ind];
      value = raw[ind+1..$];
    }

    if (!exists(name)) {
      throw new UnknownFlagException(name);
    }

    Argument arg = byLong[name];

    arg.use();
    if (hasValue) {
      if (arg.parameterized()) {
        arg.value(value);
        return;
      }
      throw new UnexpectedParameterException(arg, value);
    }

    // Nothing left to do.
    if(arg.hasOptionalParam() || !arg.parameterized()) {
      return;
    }

    // Arg has mandatory param and no value.
    throw new MissingParameterException(arg);
  }

  private void seekOptParam(const char c, const string raw) {
    debug(dOpts) printDebug(__FUNCTION__, ""~c, raw);
    if (isDash(c)) {
      strPos++;
      state = State.FLAG_START;
      return;
    }

    strPos = raw.length;
    state = State.SEEK;
    lastArg.value(raw);
  }

  private void seekReqParam(const char c, const string raw) {
    debug(dOpts) printDebug(__FUNCTION__, ""~c, raw);
    if (isDash(c)) {
      throw new MissingParameterException(lastArg);
    }

    strPos = raw.length;
    state = state.SEEK;
    lastArg.value(raw);
  }

  private bool exists(string key) const {
    auto t = (key in byLong);
    return t != null;
  }

  private bool exists(char key) const {
    auto t = (key in byShort);
    return t != null;
  }

  private bool isDash(const char c) const {
    debug(dOpts) printDebug(__FUNCTION__, ""~c);
    return c == DASH;
  }

  debug(dOpts) {
    void printDebug(const string method, const string[] args...) const {
      const string tmp = method[__MODULE__.length + 11..$];
      writefln("Pos: %2d | State: %-14s | Method: %s(%s)", strPos, state, tmp, args);
    }
  }
}
