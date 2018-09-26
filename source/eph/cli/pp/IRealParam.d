module eph.cli.pp.pireal;

import eph.cli.pp.iparse;

/**
 * Parses input strings into ireal values.
 */
public immutable class IRealParam : ParamParser!ireal {
  public override ireal param(const string val) const {
    return parse!ireal(val);
  }
}
