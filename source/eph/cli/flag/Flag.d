module eph.cli.flag.flag;

import eph.cli.base.component: CliComponent;
import eph.cli.flag.roflag: ReadOnlyFlag;
import eph.cli.com.command: Command;

/**
 * Read / Write access to a CLI flag.
 *
 * @param T flag value type
 */
public interface Flag(T) : ReadOnlyFlag!T, CliComponent {

  /**
   * Sets the short form for this CLI flag.
   */
  public Flag!T setShortFlag(const char c);

  /**
   * Sets the long form for this CLI flag.
   */
  public Flag!T setLongFlag(const string s);

  /**
   * Sets this flag as requring a value.
   *
   * This will also mark this CLI flag as expecting a value.
   */
  public Flag!T requireValue();

  /**
   * Sets whether or not this flag requires a value.
   *
   * Setting this value to true will also mark this value
   * as expecting a value.
   *
   * Setting this value to false will not stop this flag
   * from expecting a value.
   */
  public Flag!T setValueRequired(const bool val);

  /**
   * Marks this flag as expecting a value.
   */
  public Flag!T expectValue();

  /**
   * Returns a mutable handle for this flags values.
   */
  public T[] getMutValues();

  /**
   * Sets whether or not this flag expects a value.
   *
   * Setting this value to false will also disable the
   * require value setting.
   */
  public Flag!T setValueExpected(const bool val);

  /**
   * Appends a value to the internal value collection for
   * this flag.
   */
  public Flag!T appendValue(const string val);

  /**
   * Returns a mutable handle for this Flag's parent
   * Command.
   */
  public Command getMutParent();
}
