module eph.cli.pp.pdouble;

import eph.cli.pp.iparse;

/**
 * Parses input strings into idouble values.
 */
public immutable class IDoubleParam : ParamParser!idouble {
  public override idouble param(const string val) const {
    return parse!idouble(val);
  }
}
