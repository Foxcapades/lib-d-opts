module eph.cli.pp.pbyte;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a byte value.
 */
public immutable class ByteParam : ParamParser!byte {
  public override byte param(const string val) const {
    return parse!byte(val);
  }
}
