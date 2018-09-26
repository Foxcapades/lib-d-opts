module eph.cli.flag.fubyte;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class UByteFlag : AbstractFlag!(ubyte, UByteFlag) {
  private const ParamParser!ubyte parser;

  public this(const ParamParser!ubyte parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new UByteParam();
  }

  protected override ubyte parse(const string val) const {
    return parser.parse(val);
  }
}
