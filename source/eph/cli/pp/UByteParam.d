module eph.cli.pp.pubyte;

import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a ubyte value.
 */
public immutable class UByteParam : ParamParser!ubyte {
  public override ubyte param(const string val) const {
    return parse!ubyte(val);
  }
}
