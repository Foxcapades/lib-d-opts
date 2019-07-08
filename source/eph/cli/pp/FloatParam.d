module eph.cli.pp.pfloat;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a float value.
 */
public class FloatParam : ParamParser!(float) {

  /**
   * Parses the given string value into a float value.
   */
  public float parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return to!float(val);
  }
}
