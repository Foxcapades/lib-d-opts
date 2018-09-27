module eph.cli.flag.fchar;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

public class CharFlag : AbstractFlag!(char) {
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
