module eph.cli.pp.pushort;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a ushort value.
 */
public class UShortParam : ParamParser!ushort {
  public ushort parse(const string val) const {
    return to!ushort(val);
  }
}
