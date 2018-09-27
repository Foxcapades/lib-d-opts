module eph.cli.pp.pint;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string value into an int value.
 */
public class IntParam : ParamParser!(int) {
  private immutable uint radix;

  /**
   * Constructor allowing the use of an optional radix for
   * string to int conversions.
   */
  public immutable this(const uint radix = 10) {
    this.radix = radix;
  }

  public int parse(const string val) const{
    return to!int(val, radix);
  }
}
