module eph.cli.flag.fushort;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting an unsigned short value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class UShortFlag : AbstractFlag!ushort {

  private const ParamParser!ushort parser;

  /**
   * Constructs this flag with a custom unsigned short
   * parser.
   */
  public this(const ParamParser!ushort parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default unsigned short
   * parser.
   */
  public this() {
    this.parser = new UShortParam();
  }

  /**
   * Parse the raw input string value into an unsigned short
   * val.
   */
  protected override ushort parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
