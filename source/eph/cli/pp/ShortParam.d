module eph.cli.pp.pshort;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a short value.
 */
public class ShortParam : ParamParser!short {
  public short parse(const string val) const {
    return to!short(val);
  }
}
