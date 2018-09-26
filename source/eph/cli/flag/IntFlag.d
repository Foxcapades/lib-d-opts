module eph.cli.flag.fint;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class IntFlag : AbstractFlag!(int, IntFlag) {
  private const ParamParser!int parser;

  public this(const ParamParser!int parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new IntParam();
  }

  protected override int parse(const string val) const {
    return parser.parse(val);
  }
}
