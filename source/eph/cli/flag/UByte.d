module eph.cli.flag.fubyte;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

public class UByteFlag : AbstractFlag!ubyte {
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
