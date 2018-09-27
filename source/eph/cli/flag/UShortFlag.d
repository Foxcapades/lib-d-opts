module eph.cli.flag.fushort;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

public class UShortFlag : AbstractFlag!ushort {
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
