module eph.cli.flag.fbool;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting a boolean input as a
 * param value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class BoolFlag : AbstractFlag!bool {

  private const ParamParser!bool parser;

  /**
   * Constructs this flag with a custom boolean parser.
   */
  public this(const ParamParser!bool parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default boolean parser.
   */
  public this() {
    this.parser = new BoolParam();
  }

  /**
   * Parse the raw input string value into a boolean val.
   */
  protected override bool parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
