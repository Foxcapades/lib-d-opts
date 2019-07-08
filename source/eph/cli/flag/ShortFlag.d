module eph.cli.flag.fshort;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting a short input as a
 * param value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class ShortFlag : AbstractFlag!short {

  private const ParamParser!short parser;

  /**
   * Constructs this flag with a custom short parser.
   */
  public this(const ParamParser!short parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default short parser.
   */
  public this() {
    this.parser = new ShortParam();
  }

  /**
   * Parse the raw input string value into a short val.
   */
  protected override short parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
