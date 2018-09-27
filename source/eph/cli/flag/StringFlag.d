module eph.cli.flag.fstring;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

public class StringFlag : AbstractFlag!string {
  private const ParamParser!string parser;

  public this(const ParamParser!string parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new StringParam();
  }

  protected override string parse(const string val) const {
    return parser.parse(val);
  }
}
