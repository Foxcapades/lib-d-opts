module eph.cli.pp.pbool;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a bool value.
 */
public class BoolParam : ParamParser!bool
{
  /**
   * Parses the given string value into a bool value.
   */
  public bool parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    switch(val[0]) {
      case 'f', '0', 'n':
        return false;
      default:
        return true;
    }
  }
}
