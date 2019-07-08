module eph.cli.pp.pulong;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a ulong value.
 */
public class ULongParam : ParamParser!(ulong) {

  private immutable uint radix;

  /**
   * Constructor allowing the use of an optional radix for
   * string to ulong conversions.
   */
  public immutable this(immutable uint radix = 10) {
    this.radix = radix;
  }

  /**
   * Parses the given string value into a ulong value.
   */
  public ulong parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return to!ulong(val, radix);
  }
}
