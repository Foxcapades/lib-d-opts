module eph.cli.flag.flong;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting a long input as a param
 * value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class LongFlag : AbstractFlag!long {

  private immutable ParamParser!long parser;

  /**
   * Constructs this flag with a custom long parser.
   */
  public this(immutable ParamParser!long parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default long parser.
   */
  public this() {
    this.parser = new immutable LongParam();
  }

  /**
   * Parse the raw input string value into a long val.
   */
  protected override long parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
