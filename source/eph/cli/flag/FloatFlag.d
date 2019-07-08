module eph.cli.flag.ffloat;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp.iparse: ParamParser;
import eph.cli.pp.pfloat: FloatParam;

/**
 * A flag implementation expecting a float input as a param
 * value.
 *
 * Authors: Elizabeth Harper <foxcapade@gmail.com>
 */
public class FloatFlag : AbstractFlag!float {
  private const ParamParser!float parser;

  /**
   * Constructs this flag with a custom float parser.
   */
  public this(const ParamParser!float parser) {
    this.parser = parser;
  }

  /**
   * Constructs this flag with the default float parser.
   */
  public this() {
    this.parser = new FloatParam();
  }

  /**
   * Parse the raw input string value into a float val.
   */
  protected override float parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return parser.parse(val);
  }
}

