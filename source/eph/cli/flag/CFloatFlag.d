module eph.cli.flag.fcfloat;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class CFloatFlag : AbstractFlag!(cfloat, CFloatFlag) {
  private const ParamParser!cfloat parser;

  public this(const ParamParser!cfloat parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new CFloatParam();
  }

  protected override cfloat parse(const string val) const {
    return parser.parse(val);
  }
}
