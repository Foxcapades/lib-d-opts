module eph.cli.pp.pfloat;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a float value.
 */
public class FloatParam : ParamParser!(float) {
  public float parse(const string val) const {
    return to!float(val);
  }
}
