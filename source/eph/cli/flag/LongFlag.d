module eph.cli.flag.flong;

import eph.cli.flag.base: AbstractFlag;
import eph.cli.pp;

public class LongFlag : AbstractFlag!long {
  private immutable ParamParser!long parser;

  public this(immutable ParamParser!long parser) {
    this.parser = parser;
  }

  public this() {
    this.parser = new immutable LongParam();
  }

  protected override long parse(const string val) const {
    return parser.parse(val);
  }
}
