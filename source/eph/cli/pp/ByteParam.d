module eph.cli.pp.pbyte;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a byte value.
 */
public class ByteParam : ParamParser!byte
{
  /**
   * Parses the given string value into a byte value.
   */
  public byte parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return to!byte(val);
  }
}
