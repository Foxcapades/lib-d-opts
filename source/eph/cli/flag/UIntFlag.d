module eph.cli.flag.fuint;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting a unsigned integer input
 * as a param value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class UIntFlag : AbstractFlag!uint {

  private immutable ParamParser!uint parser;

  /**
   * Constructs this flag with a custom unsigned integer
   * parser.
   */
  public this(immutable ParamParser!uint parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default unsigned integer
   * parser.
   */
  public this() {
    this.parser = new immutable UIntParam();
  }

  /**
   * Parse the raw input string value into a unsigned
   * integer val.
   */
  protected override uint parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
