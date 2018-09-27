module eph.cli.flag.fuint;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

public class UIntFlag : AbstractFlag!uint {
  private immutable ParamParser!uint parser;

  public this(immutable ParamParser!uint parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new immutable UIntParam();
  }

  protected override uint parse(const string val) const {
    return parser.parse(val);
  }
}
