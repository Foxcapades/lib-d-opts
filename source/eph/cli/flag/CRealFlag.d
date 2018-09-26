module eph.cli.flag.fcreal;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class CRealFlag : AbstractFlag!(creal, CRealFlag) {
  private const ParamParser!creal parser;

  public this(const ParamParser!creal parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new CRealParam();
  }

  protected override creal parse(const string val) const {
    return parser.parse(val);
  }
}
