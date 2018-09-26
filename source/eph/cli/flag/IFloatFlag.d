module eph.cli.flag.fifloat;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class IFloatFlag : AbstractFlag!(ifloat, IFloatFlag) {
  private const ParamParser!ifloat parser;

  public this(const ParamParser!ifloat parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new IFloatParam();
  }

  protected override ifloat parse(const string val) const {
    return parser.parse(val);
  }
}
