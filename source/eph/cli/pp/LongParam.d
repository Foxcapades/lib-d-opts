module eph.cli.pp.plong;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string value into a long value.
 */
public class LongParam : ParamParser!(long) {
  private immutable uint radix;

  /**
   * Constructor allowing the use of an optional radix for
   * string to long conversions.
   */
  public immutable this(const uint radix = 10) {
    this.radix = radix;
  }

  /**
   * Parses the given string value into a long value.
   */
  public long parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return to!long(val, radix);
  }
}
