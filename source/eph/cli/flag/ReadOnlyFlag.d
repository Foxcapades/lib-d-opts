module eph.cli.flag.roflag;

import eph.cli.component;

/**
 * Read only access to a CLI flag.
 *
 * @param T flag value type
 */
public interface ReadOnlyFlag(T) : ReadOnlyCliComponent {
  /**
   * Gets the short form set on this cli flag.
   */
  public char shortFlag() const;

  /**
   * Gets whether or not this cli flag has a short form.
   */
  public bool hasShortFlag() const;

  /**
   * Gets the long form set on this cli flag.
   */
  public string longFlag() const;

  /**
   * Gets whether or not this cli flag has a long form.
   */
  public bool hasLongFlag() const;

  /**
   * Gets the values passed for this flag in the CLI call.
   */
  public T[] values() const;

  /**
   * Gets whether or not this CLI flag expects a value.
   */
  public bool expectsValue() const;

  /**
   * Gets whether or not this CLI flag requires a value.
   *
   * If this returns true, expectsValue() must also return
   * true.
   */
  public bool requiresValue() const;

  /**
   * Gets the number of times this flag was used in the CLI
   * call.
   */
  public uint useCount() const;
}
