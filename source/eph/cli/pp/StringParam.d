module eph.cli.pp.pstring;

import eph.cli.pp.iparse;

/**
 * Parameter value passthrough.  Returns a copy of the input
 * string unchanged.
 */
public immutable class StringParam : ParamParser!string {
  public override string parse(const string val) const {
    return val.dup();
  }
}
