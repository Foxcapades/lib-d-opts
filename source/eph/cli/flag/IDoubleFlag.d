module eph.cli.flag.fidouble;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class IDoubleFlag : AbstractFlag!(idouble, IDoubleFlag) {
  private const ParamParser!idouble parser;

  public this(const ParamParser!idouble parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new IDoubleParam();
  }

  protected override idouble parse(const string val) const {
    return parser.parse(val);
  }
}
