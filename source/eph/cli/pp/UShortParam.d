module eph.cli.pp.pushort;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a ushort value.
 */
public immutable class UShortParam : ParamParser!ushort {
  public override ushort param(const string val) const {
    return parse!ushort(val);
  }
}
