module eph.cli.pp.preal;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a real value.
 */
public class RealParam : ParamParser!real {
  public real parse(const string val) const {
    return to!real(val);
  }
}
