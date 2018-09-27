module eph.cli.pp.pstring;

import eph.cli.pp.iparse;

/**
 * Parameter value passthrough.  Returns a copy of the input
 * string unchanged.
 */
public class StringParam : ParamParser!string {
  public string parse(const string val) const {
    return val.dup();
  }
}
