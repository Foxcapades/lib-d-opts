module eph.cli.com.rocommand;

import eph.cli.component;
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
   * Gets this command's name.
   */
  public string name() const;

  /**
   * Gets this command's parameters as read only.
   */
  public ReadOnlyParameter[] parameters() const;

  /**
   * Gets this command's subcommands as read only.
   */
  public ReadOnlyCommand[] subCommands() const;

  /**
   * Gets this command's flags as read only.
   */
  public ReadOnlyFlag[] flags() const;
}
