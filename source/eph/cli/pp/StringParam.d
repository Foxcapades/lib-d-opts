module eph.cli.pp.pstring;

import eph.cli.pp.iparse;

/**
 * Parameter value passthrough.  Returns a copy of the input
 * string unchanged.
 */
public class StringParam : ParamParser!string {

  /**
   * Parses the given string value into a string value.
   */
  public string parse(const string val) const
  in {
    assert(val !is null);
  }
  do {
    return val.dup();
  }
}
