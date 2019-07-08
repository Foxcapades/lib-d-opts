module eph.cli.pp.pushort;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a ushort value.
 */
public class UShortParam : ParamParser!ushort {

  /**
   * Parses the given string value into a ushort value.
   */
  public ushort parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return to!ushort(val);
  }
}
