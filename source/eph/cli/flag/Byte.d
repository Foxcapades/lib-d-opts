module eph.cli.flag.fbyte;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class ByteFlag : AbstractFlag!(byte, ByteFlag) {
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
