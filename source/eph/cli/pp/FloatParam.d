module eph.cli.pp.pfloat;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a float value.
 */
public immutable class FloatParam : ParamParser!(float) {
  public override float parse(const string val) const {
    return parse!float(val);
  }
}
