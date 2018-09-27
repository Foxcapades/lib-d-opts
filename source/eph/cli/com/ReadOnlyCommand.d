module eph.cli.com.rocommand;

import eph.cli.base;
import eph.cli.parameter;
import eph.cli.flag;

// public interface Arguments {
//   public Flag[] usedFlags() const;
//   public Flag[] unusedFlags() const;

//   public Parameter[] usedParams() const;
//   public Parameter[] unusedParams() const;

//   public bool hasErrors() const;
// }

/**
 * Read only CLI Command accessor
 */
public interface ReadOnlyCommand : ReadOnlyCliComponent {

  /**
   * Returns this command's name.
   */
  public string name() const;

  /**
   * Returns this command's parameters as read only.
   */
  public ReadOnlyParameter!void[] parameters() const;

  /**
   * Returns this command's subcommands as read only.
   */
  public ReadOnlyCommand[] subCommands() const;

  /**
   * Returns this command's flags as read only.
   */
  public ReadOnlyFlag!void[] flags() const;

  /**
   * Returns a read only handle for this Command's parent
   * Command.
   *
   * If this is a root level Command, this method will
   * return null.
   */
  public ReadOnlyCommand parent() const;
}
