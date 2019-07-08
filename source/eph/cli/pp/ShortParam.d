module eph.cli.pp.pshort;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a short value.
 */
public class ShortParam : ParamParser!short {

  /**
   * Parses the given string value into a short value.
   */
  public short parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return to!short(val);
  }
}
