module eph.cli.pp.iparse;

import std.conv : parse;

/**
 * Parameter value parser.
 */
public interface ParamParser(T) {
  /**
   * Parse the input string into the value type specified by
   * the generic type T.
   */
  public T parse(const string val) const;
}
