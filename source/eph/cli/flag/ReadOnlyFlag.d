module eph.cli.flag.roflag;

import eph.cli.base.rocomponent: ReadOnlyCliComponent;
import eph.cli.com.rocommand: ReadOnlyCommand;

/**
 * Read only access to a CLI flag.
 *
 * @param T flag value type
 */
public const interface ReadOnlyFlag(T) : ReadOnlyCliComponent {
  /**
   * Returns the short form set on this cli flag.
   */
  public char getShortFlag();

  /**
   * Returns whether or not this cli flag has a short form.
   */
  public bool hasShortFlag();

  /**
   * Returns the long form set on this cli flag.
   */
  public string getLongFlag();

  /**
   * Returns whether or not this cli flag has a long form.
   */
  public bool hasLongFlag();

  /**
   * Returns the values passed for this flag in the CLI
   * call.
   */
  public T[] getValues();

  /**
   * Returns whether or not this CLI flag expects a value.
   */
  public bool expectsValue();

  /**
   * Returns whether or not this CLI flag requires a value.
   *
   * If this returns true, expectsValue() must also return
   * true.
   */
  public bool requiresValue();

  /**
   * Returns a read only handle on this Flag's parent
   * Command.
   */
  public ReadOnlyCommand getParent();

  /**
   * Returns the number of times this flag was used in the
   * CLI call.
   */
  public uint useCount();
}
