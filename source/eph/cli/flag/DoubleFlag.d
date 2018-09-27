module eph.cli.flag.fdouble;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp.iparse: ParamParser;
import eph.cli.pp.pdouble: DoubleParam;

public class DoubleFlag : AbstractFlag!double {
  private const ParamParser!double parser;

  public this(const ParamParser!double parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new DoubleParam();
  }

  protected override double parse(const string val) const {
    return parser.parse(val);
  }
}
