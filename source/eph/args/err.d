module eph.args.err;

import std.string: format;

import eph.args.arg: Argument;
import eph.args.param: Parameter;

public class ConflictingOptionsException: Exception {
  private const Argument opt1;
  private const Argument opt2;

  this(const Argument a, const Argument b) {
    super(format("Conflicting options:
      %s
      %s"));
    this.opt1 = a;
    this.opt2 = b;
  }

  public const(Argument) getOption1() const {
    return opt1;
  }

  public const(Argument) getOption2() const {
    return opt2;
  }
}

public class UnknownFlagException: Exception {
  private const bool wasShort;
  private const char shortFlag;
  private const string longFlag;

  this(const char c) {
    super(format("Unrecognized option -%s", c));
    wasShort = true;
    shortFlag = c;
    longFlag = "";
  }

  this(string s) {
    super(format("Unrecognized option --%s", s));
    wasShort = false;
    shortFlag = 0;
    longFlag = s;
  }

  public const(bool) wasShortFlag() const {
    return wasShort;
  }

  public const(char) getShortFlag() const {
    return shortFlag;
  }

  public const(string) getLongFlag() const {
    return longFlag;
  }
}

public class MissingParameterException: Exception {
  private const Argument opt;
  private const Parameter param;

  this(const Argument opt) {
    super(format("argument %s requires a value", optName(opt)));
    this.opt = opt;
    this.param = null;
  }

  this(const Parameter param) {
    super(format("missing required parameter %s", param.name()));
    this.opt   = null;
    this.param = param;
  }

  public const(Argument) getArgument() const {
    return opt;
  }

  public const(Parameter) getParameter() const {
    return param;
  }
}

public class UnexpectedParameterException: Exception {
  private const Argument arg;
  private const string value;

  this(const Argument opt, const string val) {
    super(format("argument %s does not take a value", optName(opt)));
    arg = opt;
    value = val;
  }

  public const(Argument) getArgument() const {
    return arg;
  }

  public const(string) getValue() const {
    return value;
  }
}

private string optName(const Argument opt) {
  const bool l = opt.hasLongFrom();
  const bool s = opt.hasShortFlag();

  if(l && s) {
    return format("-%s/--%s", opt.shortFlag(), opt.longFlag());
  }

  if(l) {
    return format("--%s", opt.longFlag());
  }

  return format("-%s", opt.shortFlag());
}
