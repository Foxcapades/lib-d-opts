module eph.cli.flag.fshort;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class ShortFlag : AbstractFlag!(short, ShortFlag) {
  private const ParamParser!short parser;

  public this(const ParamParser!short parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new ShortParam();
  }

  protected override short parse(const string val) const {
    return parser.parse(val);
  }
}
