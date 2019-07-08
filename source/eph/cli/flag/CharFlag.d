module eph.cli.flag.fchar;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting a single character input
 * as a param value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class CharFlag : AbstractFlag!(char) {

  private const ParamParser!char parser;

  /**
   * Constructs this flag with a custom character parser.
   */
  public this(const ParamParser!char parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default character parser.
   */
  public this() {
    this.parser = new CharParam();
  }

  /**
   * Parse the raw input string value into a character val.
   */
  protected override char parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
