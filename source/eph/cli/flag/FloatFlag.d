module eph.cli.flag.ffloat;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class FloatFlag : AbstractFlag!(float, FloatFlag) {
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

