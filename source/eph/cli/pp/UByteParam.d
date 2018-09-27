module eph.cli.pp.pubyte;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a ubyte value.
 */
public class UByteParam : ParamParser!ubyte {
  public ubyte parse(const string val) const {
    return to!ubyte(val);
  }
}
