module eph.cli.flag.fulong;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting an unsigned long value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class ULongFlag : AbstractFlag!ulong {

  private immutable ParamParser!ulong parser;

  /**
   * Constructs this flag with a custom unsigned long
   * parser.
   */
  public this(immutable ParamParser!ulong parser)
  in {
    assert(parser !is null);
  }
  do {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default unsigned short
   * parser.
   */
  public this() {
    this.parser = new immutable ULongParam();
  }

  /**
   * Parse the raw input string value into an unsigned long
   * val.
   */
  protected override ulong parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
