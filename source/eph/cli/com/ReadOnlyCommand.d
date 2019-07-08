module eph.cli.com.rocommand;

import eph.cli.base;
import eph.cli.parameter;
import eph.cli.flag;

/**
 * Read only CLI Command accessor
 */
public interface ConstCommand:
  // extends
  ConstCliComponent
{

  /**
   * Returns this command's name.
   *
   * @return
   *   the name of this command
   */
  public string getName() const;

  /**
   * Returns this command's parameters as read only.
   *
   * TODO: Should this be returning a const or immutable typed collection?
   *
   * @return
   *   collection of read only parameters
   */
  public ReadOnlyParameter!void[] getParameters() const;

  /**
   * Returns this command's subcommands as read only.
   *
   * TODO: Should this be returning a const or immutable typed collection?
   *
   * @return
   *   collection of read only commands
   */
  public ConstCommand[] getSubCommands() const;

  /**
   * Returns this command's flags as read only.
   *
   * TODO: Should this be returning a const or immutable typed collection?
   *
   * @return
   *   collection of read only flags
   */
  public ConstFlag!void[] getFlags() const;

  /**
   * Returns a read only handle for this Command's parent
   * Command.
   *
   * If this is a root level Command, this method will
   * return null.
   *
   * @return
   *   constant reference to this command's parent (if any)
   */
  public ConstCommand getParent() const;
}
