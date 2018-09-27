module eph.cli.pp.puint;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a uint value.
 */
public class UIntParam : ParamParser!(uint) {
  private immutable uint radix;

  /**
   * Constructor allowing the use of an optional radix for
   * string to uint conversions.
   */
  public immutable this(immutable uint radix = 10) {
    this.radix = radix;
  }

  public uint parse(const string val) const {
    return to!uint(val);
  }
}
