module eph.cli.flag.fbool;

import eph.cli.flag.base;
import eph.cli.paramparse;

public class BoolFlag : AbstractFlag!(bool, BoolFlag) {
  protected override bool parse(const string val) const {
    switch(val[0]) {
      case 'f', '0', 'n':
        return false;
      default:
        return true;
    }
  }
}
