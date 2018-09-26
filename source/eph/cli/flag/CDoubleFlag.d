module eph.cli.flag.fcdouble;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class CDoubleFlag : AbstractFlag!(cdouble, CDoubleFlag) {
  private const ParamParser!cdouble parser;

  public this(const ParamParser!cdouble parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new CDoubleParam();
  }

  protected override cdouble parse(const string val) const {
    return parser.parse(val);
  }
}
