module eph.cli.pp.pdouble;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a double value.
 */
public class DoubleParam : ParamParser!(double) {
  public double parse(const string val) const {
    return to!double(val);
  }
}
