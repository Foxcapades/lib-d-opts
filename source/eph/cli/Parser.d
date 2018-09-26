module eph.cli.parser;

import eph.cli.com.command;
import eph.cli.parameter;
import eph.cli.flag;

public class App {
  private Command com;
  private bool top;

  public App rootCommand(Command com) {
    this.com = com;
    return this;
  }

  /**
   * Run from the top down or bottom up.
   *
   * Setting this value to true means the root command will
   * have its run method executed.  It will be up to the up
   * to the implementation to call the selected sub commands
   * down the tree.
   *
   * Setting this value to false means that the last command
   * selected on the command tree will have its run method
   * called.  It will be up to the implementation to
   * retrieve flag / param info from parent commands.
   *
   * Examples:
   *
   * Given the following cli call:
   *
   * ```bash
   * $ app sub1 sub2 sub3
   * ```
   *
   * If topDown = true, then app.run() will be called.
   *
   * If topDown = false, then sub3.run() will be called.
   */
  public App topDown(const bool val) {
    this.top = val;
    return this;
  }

  public int run(const string[] args) {}
}
