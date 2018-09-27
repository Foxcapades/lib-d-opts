module eph.cli.flag.ffloat;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp.iparse: ParamParser;
import eph.cli.pp.pfloat: FloatParam;

public class FloatFlag : AbstractFlag!float {
  private const ParamParser!float parser;

  public this(const ParamParser!float parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new FloatParam();
  }

  protected override float parse(const string val) const {
    return parser.parse(val);
  }
}

