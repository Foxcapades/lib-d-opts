module eph.cli.pp.pchar;

import eph.cli.pp.iparse;

/**
 * Parses input strings into char values.
 *
 * This is accomplished by copying the first character of
 * the input string.
 */
public class CharParam : ParamParser!char {
  public char parse(const string val) const {
    return val[0];
  }
}
