module eph.cli.flag.flag;

import eph.cli.component;
import eph.cli.flag.roflag;

/**
 * Read / Write access to a CLI flag.
 *
 * @param T flag value type
 * @param S extending type
 */
public interface Flag(T, S : Flag!(T, S)) : ReadOnlyFlag!T, CliComponent!S {

  /**
   * Sets the short form for this CLI flag.
   */
  public S shortFlag(const char c);

  /**
   * Sets the long form for this CLI flag.
   */
  public S longFlag(const char c);

  /**
   * Sets this flag as requring a value.
   *
   * This will also mark this CLI flag as expecting a value.
   */
  public S requireValue();

  /**
   * Sets whether or not this flag requires a value.
   *
   * Setting this value to true will also mark this value
   * as expecting a value.
   *
   * Setting this value to false will not stop this flag
   * from expecting a value.
   */
  public S valueRequired(const bool val);

  /**
   * Marks this flag as expecting a value.
   */
  public S expectValue();

  /**
   * Sets whether or not this flag expects a value.
   *
   * Setting this value to false will also disable the
   * require value setting.
   */
  public S valueExpected(const bool val);

  /**
   * Appends a value to the internal value collection for
   * this flag.
   */
  public S appendValue(const string val);
}
