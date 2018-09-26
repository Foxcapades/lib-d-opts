module eph.cli.pp.puint;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a uint value.
 */
public immutable class UIntParam : ParamParser!(uint) {
  private immutable uint radix;

  /**
   * Constructor allowing the use of an optional radix for
   * string to uint conversions.
   */
  public immutable this(const uint radix = 10) {
    this.radix = radix;
  }

  public override uint parse(const string val) const {
    return parse!float(val);
  }
}
