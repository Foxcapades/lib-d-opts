module eph.cli.flag.fulong;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

public class ULongFlag : AbstractFlag!ulong {
  private immutable ParamParser!ulong parser;

  public this(immutable ParamParser!ulong parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new immutable ULongParam();
  }

  protected override ulong parse(const string val) const {
    return parser.parse(val);
  }
}
