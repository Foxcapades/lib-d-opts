module eph.cli.pp.pulong;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a ulong value.
 */
public immutable class ULongParam : ParamParser!(ulong) {
  private immutable uint radix;

  /**
   * Constructor allowing the use of an optional radix for
   * string to ulong conversions.
   */
  public immutable this(const uint radix = 10) {
    this.radix = radix;
  }

  public override ulong param(const string val) const {
    return parse!ulong(val, radix);
  }
}
