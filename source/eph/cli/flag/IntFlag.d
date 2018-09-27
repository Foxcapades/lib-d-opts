module eph.cli.flag.fint;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

public class IntFlag : AbstractFlag!int {
  private immutable ParamParser!int parser;

  public this(immutable ParamParser!int parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new immutable IntParam();
  }

  protected override int parse(const string val) const {
    return parser.parse(val);
  }
}
