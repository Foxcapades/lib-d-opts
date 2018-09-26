module eph.cli.pp.pshort;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a short value.
 */
public immutable class ShortParam : ParamParser!short {
  public override short param(const string val) const {
    return parse!short(val);
  }
}
