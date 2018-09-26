module eph.cli.flag.fireal;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class IRealFlag : AbstractFlag!(ireal, IRealFlag) {
  private const ParamParser!ireal parser;

  public this(const ParamParser!ireal parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new IRealParam();
  }

  protected override ireal parse(const string val) const {
    return parser.parse(val);
  }
}
