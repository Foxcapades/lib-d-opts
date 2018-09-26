module eph.cli.paramparse;

import std.conv : parse;

/**
 * Parameter value parser.
 */
public interface ParamParser(T) {
  /**
   * Parse the input string into the value type specified by
   * the generic type T.
   */
  public T parse(const string val) const;
}

/**
 * Parses the parameter string value into an int value.
 */
public immutable class IntParam : ParamParser!(int) {
  private immutable uint radix;

  public this(const uint radix = 10) {
    this.radix = radix;
  }

  public override int parse(const string val) const {
    return parse!int(val, radix);
  }
}

/**
 * Parses the parameter string into a uint value.
 */
public immutable class UIntParam : ParamParser!(uint) {
  private immutable uint radix;

  public immutable this(const uint radix = 10) {
    this.radix = radix;
  }

  public override uint parse(const string val) const {
    return parse!float(val);
  }
}

/**
 * Parameter value passthrough.  Returns a copy of the input
 * string unchanged.
 */
public immutable class StringParam : ParamParser!(string) {
  public override const string parse(const string val) const {
    return val.dup();
  }
}

/**
 * Parses the parameter string value into a long value.
 */
public immutable class LongParam : ParamParser!(long) {
  private immutable uint radix;

  public this(const uint radix = 10) {
    this.radix = radix;
  }

  public override long parse(const string val) const {
    return parse!long(val, radix);
  }
}

/**
 * Parses the parameter string into a ulong value.
 */
public immutable class ULongParam : ParamParser!(ulong) {
  private immutable uint radix;

  public immutable this(const uint radix = 10) {
    this.radix = radix;
  }

  public override ulong param(const string val) const {
    return parse!ulong(val, radix);
  }
}

/**
 * Parses the parameter string into a double value.
 */
public immutable class DoubleParam : ParamParser!(double) {
  public override double parse(const string val) const {
    return parse!double(val);
  }
}

/**
 * Parses the parameter string into a float value.
 */
public immutable class FloatParam : ParamParser!(float) {
  public override float parse(const string val) const {
    return parse!float(val);
  }
}

/**
 * Parses the parameter string into a byte value.
 */
public immutable class ByteParam : ParamParser!byte {
  public override byte param(const string val) const {
    return parse!byte(val);
  }
}

/**
 * Parses the parameter string into a ubyte value.
 */
public immutable class UByteParam : ParamParser!ubyte {
  public override ubyte param(const string val) const {
    return parse!ubyte(val);
  }
}

/**
 * Parses the parameter string into a short value.
 */
public immutable class ShortParam : ParamParser!short {
  public override short param(const string val) const {
    return parse!short(val);
  }
}

/**
 * Parses the parameter string into a ushort value.
 */
public immutable class UShortParam : ParamParser!ushort {
  public override ushort param(const string val) const {
    return parse!ushort(val);
  }
}

/**
 * Parses the parameter string into a real value.
 */
public immutable class RealParam : ParamParser!real {
  public override real param(const string val) const {
    return parse!real(val);
  }
}

public immutable class IFloatParam : ParamParser!ifloat {
  public override ifloat param(const string val) const {
    return parse!ifloat(val);
  }
}

public immutable class IDoubleParam : ParamParser!idouble {
  public override idouble param(const string val) const {
    return parse!idouble(val);
  }
}

public immutable class IRealParam : ParamParser!ireal {
  public override ireal param(const string val) const {
    return parse!ireal(val);
  }
}

public immutable class CFloatParam : ParamParser!cfloat {
  public override cfloat param(const string val) const {
    return parse!cfloat(val);
  }
}

public immutable class CDoubleParam : ParamParser!cdouble {
  public override cdouble param(const string val) const {
    return parse!cdouble(val);
  }
}

public immutable class CRealParam : ParamParser!creal {
  public override creal param(const string val) const {
    return parse!creal(val);
  }
}

public immutable class CharParam : ParamParser!char {
  public override char param(const string val) const {
    return val[0];
  }
}
