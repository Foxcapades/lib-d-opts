module eph.cli.flag.freal;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

/**
 * A flag implementation expecting a real number input as a
 * param value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class RealFlag : AbstractFlag!real {

  private const ParamParser!real parser;

  /**
   * Constructs this flag with a custom real number parser.
   */
  public this(const ParamParser!real parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default real number
   * parser.
   */
  public this() {
    this.parser = new RealParam();
  }

  /**
   * Parse the raw input string value into a real number
   * val.
   */
  protected override real parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
