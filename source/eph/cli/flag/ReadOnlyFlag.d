module eph.cli.flag.roflag;

import eph.cli.base.rocomponent: ConstCliComponent;
import eph.cli.com.rocommand: ConstCommand;

/**
 * Non-template, collection safe {@ConstFlag} definition.
 */
public interface CollectibleConstFlag
// extends
: ConstCliComponent
{
  /**
   * Returns the short form set on this cli flag.
   */
  public char getShortFlag() const;

  /**
   * Returns whether or not this cli flag has a short form.
   */
  public bool hasShortFlag() const;

  /**
   * Returns the long form set on this cli flag.
   */
  public string getLongFlag() const;

  /**
   * Returns whether or not this cli flag has a long form.
   */
  public bool hasLongFlag() const;

  /**
   * Returns whether or not this CLI flag expects a value.
   */
  public bool expectsValue() const;

  /**
   * Returns whether or not this CLI flag requires a value.
   *
   * If this returns true, expectsValue() must also return
   * true.
   */
  public bool requiresValue() const;

  /**
   * Returns a read only handle on this Flag's parent
   * Command.
   */
  public ConstCommand getParent() const;

  /**
   * Returns the number of times this flag was used in the
   * CLI call.
   */
  public uint useCount() const;
}

/**
 * Read only access to a CLI flag.
 *
 * @param T flag value type
 */
public interface ConstFlag(T) : CollectibleConstFlag {

  /**
   * Returns the values passed for this flag in the CLI
   * call.
   */
  public T[] getValues() const;

}
