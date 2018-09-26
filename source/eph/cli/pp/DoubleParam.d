module eph.cli.pp.pdouble;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a double value.
 */
public immutable class DoubleParam : ParamParser!(double) {
  public override double parse(const string val) const {
    return parse!double(val);
  }
}
