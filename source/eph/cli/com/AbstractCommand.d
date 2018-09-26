module eph.cli.com.base;

import eph.cli.com.command;
import eph.cli.com.rocommand;
import eph.cli.component;
import eph.cli.parameter;
import eph.cli.flag;

/**
 * Abstract base for a Command
 *
 * @param S extending class type
 */
public abstract class AbstractCommand : AbstractCliComponent!Command, Command {
  private string comName;
  private Parameter[] params;
  private Command[] subComs;
  private Flag[] flgs;

  public override string name() const {
    return this.comName;
  }

  public override Command name(const string val) {
    this.comName = val;
    return this;
  }

  public override ReadOnlyParameter[] parameters() const {
    return cast(ReadOnlyParameter[]) this.params;
  }

  public override ReadOnlyCommand[] subCommands() const {
    return cast(ReadOnlyCommand[]) this.subComs;
  }

  public override ReadOnlyFlag[] flags() const {
    return cast(ReadOnlyFlag[]) this.flgs;
  }

  public override Parameter[] mutParameters() const {
    return this.params;
  }

  public override Command[] mutSubCommands() const {
    return this.subComs;
  }

  public override Flag[] mutFlags() const {
    return this.flgs;
  }
}
