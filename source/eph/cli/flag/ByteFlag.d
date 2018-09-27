module eph.cli.flag.fbyte;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

public class ByteFlag : AbstractFlag!(byte) {
  private const ParamParser!byte parser;

  public this(const ParamParser!byte parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new ByteParam();
  }

  protected override byte parse(const string val) const {
    return parser.parse(val);
  }
}
