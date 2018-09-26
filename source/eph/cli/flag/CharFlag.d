module eph.cli.flag.fchar;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class CharFlag : AbstractFlag!(char, CharFlag) {
  private const ParamParser!char parser;

  public this(const ParamParser!char parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new CharParam();
  }

  protected override char parse(const string val) const {
    return parser.parse(val);
  }
}
