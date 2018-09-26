module eph.cli.flag.flong;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class LongFlag : AbstractFlag!(long, LongFlag) {
  private const ParamParser!long parser;

  public this(const ParamParser!long parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new LongParam();
  }

  protected override long parse(const string val) const {
    return parser.parse(val);
  }
}
