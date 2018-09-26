module eph.cli.flag.fulong;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class ULongFlag : AbstractFlag!(ulong, ULongFlag) {
  private const ParamParser!ulong parser;

  public this(const ParamParser!ulong parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new ULongParam();
  }

  protected override ulong parse(const string val) const {
    return parser.parse(val);
  }
}
