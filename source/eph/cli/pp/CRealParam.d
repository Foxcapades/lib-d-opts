module eph.cli.pp.pcreal;

import eph.cli.pp.iparse;

/**
 * Parses input strings into creal values.
 */
public immutable class CRealParam : ParamParser!creal {
  public override creal param(const string val) const {
    return parse!creal(val);
  }
}
