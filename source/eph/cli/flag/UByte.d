module eph.cli.flag.fubyte;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting a unsigned byte input as
 * a param value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class UByteFlag : AbstractFlag!ubyte {

  private const ParamParser!ubyte parser;

  /**
   * Constructs this flag with a custom unsigned byte
   * parser.
   */
  public this(const ParamParser!ubyte parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default unsigned byte
   * parser.
   */
  public this() {
    this.parser = new UByteParam();
  }

  /**
   * Parse the raw input string value into a unsigned byte
   * val.
   */
  protected override ubyte parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
