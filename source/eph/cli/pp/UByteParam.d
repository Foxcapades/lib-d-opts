module eph.cli.pp.pubyte;

import std.conv: to;
import eph.cli.pp.iparse;

/**
 * Parses the parameter string into a ubyte value.
 */
public class UByteParam : ParamParser!ubyte {

  /**
   * Parses the given string value into a ubyte value.
   */
  public ubyte parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return to!ubyte(val);
  }
}
