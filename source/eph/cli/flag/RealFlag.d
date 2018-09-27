module eph.cli.flag.freal;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

public class RealFlag : AbstractFlag!real {
  private const ParamParser!real parser;

  public this(const ParamParser!real parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new RealParam();
  }

  protected override real parse(const string val) const {
    return parser.parse(val);
  }
}
