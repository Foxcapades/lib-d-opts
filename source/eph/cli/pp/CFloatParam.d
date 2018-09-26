module eph.cli.pp.pcfloat;

import eph.cli.pp.iparse;

/**
 * Parses input strings into cfloat values.
 */
public immutable class CFloatParam : ParamParser!cfloat {
  public override cfloat param(const string val) const {
    return parse!cfloat(val);
  }
}
