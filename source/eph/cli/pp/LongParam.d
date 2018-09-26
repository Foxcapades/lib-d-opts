module eph.cli.pp.plong;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string value into a long value.
 */
public immutable class LongParam : ParamParser!(long) {
  private immutable uint radix;

  /**
   * Constructor allowing the use of an optional radix for
   * string to long conversions.
   */
  public this(const uint radix = 10) {
    this.radix = radix;
  }

  public override long parse(const string val) const {
    return parse!long(val, radix);
  }
}
