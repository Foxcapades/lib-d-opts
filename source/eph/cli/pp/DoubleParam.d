module eph.cli.pp.pdouble;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a double value.
 */
public class DoubleParam : ParamParser!(double) {

  /**
   * Parses the given string value into a double value.
   */
  public double parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return to!double(val);
  }
}
