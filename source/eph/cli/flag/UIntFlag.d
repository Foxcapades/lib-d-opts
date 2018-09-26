module eph.cli.flag.fuint;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class UIntFlag : AbstractFlag!(uint, UIntFlag) {
  private const ParamParser!uint parser;

  public this(const ParamParser!uint parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new UIntParam();
  }

  protected override uint parse(const string val) const {
    return parser.parse(val);
  }
}
