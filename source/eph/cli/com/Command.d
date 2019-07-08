module eph.cli.com.command;

import eph.cli.com.rocommand: ConstCommand;
import eph.cli.base: CliComponent;
import eph.cli.parameter: Parameter;
import eph.cli.flag: Flag;

/**
 * CLI Command
 */
public interface Command
// extends
: ConstCommand
, CliComponent
{

  /**
   * Sets this command's name.
   *
   * @param name
   *   new name for this command
   *
   * @return
   *   the modified command, may or may not be the same
   *   instance this method was called on.
   */
  public T setName(this T)(const string name);

  /**
   * Returns this command's parameters as mutable.
   *
   * @return
   *   mutable reference to this Command's internal
   *   parameters
   */
  public Parameter!void[] mutParameters();

  /**
   * Returns this command's sub commands as mutable.
   *
   * @return
   *   mutable reference to this Command's sub commands
   */
  public Command[] mutSubCommands();

  /**
   * Returns this command's flags as mutable.
   *
   * @return
   *   mutable reference to this Command's flags
   */
  public Flag!void[] mutFlags();

  /**
   * Appends the given components to this Command.
   *
   * @param coms
   *   CliComponents to attach to this Command.
   *
   * @return
   *   The modified command, may or may not be the same
   *   instance this method was called on.
   */
  public T append(this T)(CliComponent[] coms...);

  /**
   * Execute this CLI command.
   */
  public int run();
}

