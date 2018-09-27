module eph.cli.pp.pbyte;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a byte value.
 */
public class ByteParam : ParamParser!byte {
  public byte parse(const string val) const {
    return to!byte(val);
  }
}
