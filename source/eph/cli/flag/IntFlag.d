module eph.cli.flag.fint;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting a int input as a param
 * value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class IntFlag : AbstractFlag!int {

  private immutable ParamParser!int parser;

  /**
   * Constructs this flag with a custom integer parser.
   */
  public this(immutable ParamParser!int parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default integer parser.
   */
  public this() {
    this.parser = new immutable IntParam();
  }

  /**
   * Parse the raw input string value into a integer val.
   */
  protected override int parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
