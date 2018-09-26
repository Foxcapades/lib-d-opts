module eph.cli.pp.pifloat;

import eph.cli.pp.iparse;

/**
 * Parses input strings into ifloat values.
 */
public immutable class IFloatParam : ParamParser!ifloat {
  public override ifloat param(const string val) const {
    return parse!ifloat(val);
  }
}
