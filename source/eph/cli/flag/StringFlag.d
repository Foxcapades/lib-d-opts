module eph.cli.flag.fstring;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting a string input as a param
 * value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class StringFlag : AbstractFlag!string {

  private const ParamParser!string parser;

  /**
   * Constructs this flag with a custom string parser.
   */
  public this(const ParamParser!string parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default string parser.
   */
  public this() {
    this.parser = new StringParam();
  }

  /**
   * Parse the raw input string value into a string val.
   */
  protected override string parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
