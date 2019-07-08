module eph.cli.app;

import eph.cli.runOrder
: RunOrder;

import eph.cli.com.command
: Command;

/**
 */
public struct App {
  /**
   * Root command
   */
  private Command com;

  /**
   * Application command resolution/run priority setting.
   */
  private RunOrder mode;

  public this(RunOrder mode = RunOrder.START) {
    this.mode = mode;
  }

  /**
   * Sets the root Command for this application.
   *
   * The root Command's name will be ignored when parsing
   * the CLI input as the command is tied to the binary's
   * name.
   */
  public App command(Command com) {
    this.com = com;
    return this;
  }

  /**
   * Sets the run mode for this application.
   */
  public App runMode(RunOrder mode) {
    this.mode = mode;
    return this;
  }

  public int run(const string[] args) {
    return 0;
  }
}
