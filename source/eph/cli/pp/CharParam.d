module eph.cli.pp.pchar;

import eph.cli.pp.iparse;

/**
 * Parses input strings into char values.
 *
 * This is accomplished by copying the first character of
 * the input string.
 */
public immutable class CharParam : ParamParser!char {
  public override char param(const string val) const {
    return val[0];
  }
}
