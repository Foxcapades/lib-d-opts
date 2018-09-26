module eph.cli.pp.pint;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string value into an int value.
 */
public immutable class IntParam : ParamParser!(int) {
  private immutable uint radix;

  /**
   * Constructor allowing the use of an optional radix for
   * string to int conversions.
   */
  public this(const uint radix = 10) {
    this.radix = radix;
  }

  public override int parse(const string val) const {
    return parse!int(val, radix);
  }
}
