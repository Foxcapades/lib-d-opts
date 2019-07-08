module eph.cli.pp.preal;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a real value.
 */
public class RealParam : ParamParser!real {

  /**
   * Parses the given string value into a real value.
   */
  public real parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return to!real(val);
  }
}
