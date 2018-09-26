module eph.cli.pp.preal;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a real value.
 */
public immutable class RealParam : ParamParser!real {
  public override real param(const string val) const {
    return parse!real(val);
  }
}
