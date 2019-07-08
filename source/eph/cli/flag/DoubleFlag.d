module eph.cli.flag.fdouble;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp.iparse: ParamParser;
import eph.cli.pp.pdouble: DoubleParam;

/**
 * A flag implementation expecting a double input as a param
 * value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class DoubleFlag : AbstractFlag!double {

  private const ParamParser!double parser;

  /**
   * Constructs this flag with a custom double parser.
   */
  public this(const ParamParser!double parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default double parser.
   */
  public this() {
    this.parser = new DoubleParam();
  }

  /**
   * Parse the raw input string value into a double val.
   */
  protected override double parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}
