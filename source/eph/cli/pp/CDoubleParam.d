module eph.cli.pp.pcdouble;

import eph.cli.pp.iparse;

/**
 * Parses input strings into cdouble values.
 */
public immutable class CDoubleParam : ParamParser!cdouble {
  public override cdouble param(const string val) const {
    return parse!cdouble(val);
  }
}
