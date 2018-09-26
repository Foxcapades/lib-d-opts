module eph.cli.flag.fushort;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class UShortFlag : AbstractFlag!(ushort, UShortFlag) {
  private const ParamParser!ushort parser;

  public this(const ParamParser!ushort parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new UShortParam();
  }

  protected override ushort parse(const string val) const {
    return parser.parse(val);
  }
}
