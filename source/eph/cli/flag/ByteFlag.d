module eph.cli.flag.fbyte;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting a single byte input
 * as a param value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class ByteFlag : AbstractFlag!(byte) {

  private const ParamParser!byte parser;

  /**
   * Constructs this flag with a custom byte parser.
   */
  public this(const ParamParser!byte parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default byte parser.
   */
  public this() {
    this.parser = new ByteParam();
  }

  /**
   * Parse the raw input string value into a byte val.
   */
  protected override byte parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
