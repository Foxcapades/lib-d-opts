module eph.cli.flag.flag;

import eph.cli.base.component: CliComponent;
import eph.cli.flag.roflag: ConstFlag, CollectibleConstFlag;
import eph.cli.com.command: Command;

/**
 * Non-template, collection safe {@link Flag} definition
 */
public interface CollectibleFlag
// extends
: CollectibleConstFlag
, CliComponent
{
  /**
   * Sets the short form for this CLI flag.
   */
  public T setShortFlag(this T)(const char c);

  /**
   * Sets the long form for this CLI flag.
   */
  public T setLongFlag(this T)(const string s);

  /**
   * Sets this flag as requring a value.
   *
   * This will also mark this CLI flag as expecting a value.
   */
  public T requireValue(this T)();

  /**
   * Sets whether or not this flag requires a value.
   *
   * Setting this value to true will also mark this value
   * as expecting a value.
   *
   * Setting this value to false will not stop this flag
   * from expecting a value.
   */
  public T setValueRequired(this T)(const bool val);

  /**
   * Marks this flag as expecting a value.
   */
  public T expectValue(this T)();

  /**
   * Sets whether or not this flag expects a value.
   *
   * Setting this value to false will also disable the
   * require value setting.
   */
  public T setValueExpected(this T)(const bool val);

  /**
   * Appends a value to the internal value collection for
   * this flag.
   */
  public T appendValue(this T)(const string val);

  /**
   * Returns a mutable handle for this Flag's parent
   * Command.
   */
  public Command getMutParent();
}

/**
 * CLI Flag definition
 *
 * @param T flag value type
 */
public interface Flag(T)
// extends
: ConstFlag!T
, CollectibleFlag
{

  /**
   * Returns a mutable handle for this flags values.
   */
  public T[] getMutValues();
}
