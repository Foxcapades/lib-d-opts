module eph.cli.com.command;

import eph.cli.com.rocommand;
import eph.cli.component;
import eph.cli.parameter;
import eph.cli.flag;

/**
 * CLI Command
 */
public interface Command : ReadOnlyCommand, CliComponent!Command {

  /**
   * Sets this command's name.
   */
  public Command name(const string name);

  /**
   * Gets this command's parameters as mutable.
   */
  public Parameter[] mutParameters() const;

  /**
   * Gets this command's sub commands as mutable.
   */
  public Command[] mutSubCommands() const;

  /**
   * Gets this command's flags as mutable.
   */
  public Flag[] mutFlags() const;

  /**
   * Execute this CLI command.
   */
  public int run();
}

