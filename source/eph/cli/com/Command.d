module eph.cli.com.command;

import eph.cli.com.rocommand;
import eph.cli.base;
import eph.cli.parameter;
import eph.cli.flag;

/**
 * CLI Command
 */
public interface Command : ReadOnlyCommand, CliComponent {

  /**
   * Sets this command's name.
   */
  public Command name(const string name);

  /**
   * Returns this command's parameters as mutable.
   */
  public Parameter!void[] mutParameters();

  /**
   * Returns this command's sub commands as mutable.
   */
  public Command[] mutSubCommands();

  /**
   * Returns this command's flags as mutable.
   */
  public Flag!void[] mutFlags();

  /**
   * Appends the given components to this Command.
   */
  public Command append(CliComponent[] coms...);

  /**
   * Execute this CLI command.
   */
  public int run();
}

