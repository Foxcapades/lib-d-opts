module eph.cli.runOrder;

import eph.cli.com.command: Command;
import eph.cli.parameter: Parameter;

/**
 * Run is used with {@link App} to control how the
 * registered {@link Command}s will be run.
 */
public enum RunOrder
{
  /**
   * The START run mode sets the application to only call
   * the {@link Command#run()} method on the root Command
   * (the one registered with {@link App#command(Command)).
   *
   * In this mode it is up to the Command implementation to
   * call it's child {@link Command}'s run method if
   * desired.
   *
   * This does not affect the parsing of {@link Flag}s or
   * positional {@link Parameter}s.
   *
   * Example:
   *
   * Given this command:
   * ```bash
   * $ myApp foo bar fizz
   * ```
   *
   * The `run()` method will only be called on myApp.
   */
  START,

  /**
   * The END run mode sets the application to only call the
   * {@link Command#run()) method on the last
   * {@link Command} name that appears in the CLI call.
   *
   * In this mode, if running the parent {@link Command} is
   * desired it will be up to the implementation to directly
   * call that method.
   *
   * This does not affect the parsing of {@link Flag}s or
   * positional {@link Parameter}s.
   *
   * Example:
   *
   * Given this command:
   * ```bash
   * $ myApp foo bar fizz
   * ```
   *
   * The `run()` method will only be called on fizz.
   */
  END,

  /**
   * The TOP_DOWN run mode sets the application to call
   * every {@link Command#run()) method in the selected
   * tree starting from the root Command and ending on the
   * last Command to appear in the CLI call.
   *
   * This does not affect the parsing of {@link Flag}s or
   * positional {@link Parameter}s.
   *
   * Example:
   *
   * Given this command:
   * ```bash
   * $ myApp foo bar fizz
   * ```
   *
   * The `run()` method will be called separately for each
   * Command in the following order:
   *
   * * myApp (root Command instance)
   * * foo
   * * bar
   * * fizz
   */
  TOP_DOWN,

  /**
   * The BOTTOM_UP run mode sets the application to call
   * every {@link Command#run()) method in the selected
   * tree starting from the last Command to appear in the
   * CLI call and ending on the root Command.
   *
   * This does not affect the parsing of {@link Flag}s or
   * positional {@link Parameter}s.
   *
   * Example:
   *
   * Given this command:
   * ```bash
   * $ myApp foo bar fizz
   * ```
   *
   * The `run()` method will be called separately for each
   * Command in the following order:
   *
   * * fizz
   * * bar
   * * foo
   * * myApp (root Command instance)
   */
  BOTTOM_UP
}

