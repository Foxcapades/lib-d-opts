module eph.cli.com.base;

import eph.cli.com.command;
import eph.cli.com.rocommand;

import eph.cli.base;
import eph.cli.parameter;
import eph.cli.flag;

/**
 * Abstract base for a Command
 *
 * @param S extending class type
 */
public abstract class AbstractCommand : AbstractCliComponent, Command {
  private string comName;
  private Parameter!void[] params;
  private Command[] subComs;
  private Flag!void[] flgs;
  private Command par;

  public string getName() const {
    return this.comName;
  }

  public Command setName(const string val) {
    this.comName = val;
    return this;
  }

  public ReadOnlyParameter!void[] getParameters() const {
    return cast(ReadOnlyParameter!void[]) this.params;
  }

  public ReadOnlyCommand[] getSubCommands() const {
    return cast(ReadOnlyCommand[]) this.subComs;
  }

  public ReadOnlyFlag!void[] getFlags() const {
    return cast(ReadOnlyFlag!void[]) this.flgs;
  }

  public Parameter!void[] getMutParameters() {
    return this.params;
  }

  public Command[] getMutSubCommands() {
    return this.subComs;
  }

  public Flag!void[] getMutFlags() {
    return this.flgs;
  }

  public Command append(CliComponent[] coms...) {
    foreach(CliComponent c; coms) {
      if (auto f = cast(Flag!void) c)
        this.flgs ~= f;
      else if (auto p = cast(Parameter!void) c)
        this.params ~= p;
      else if (auto m = cast(Command) c)
        this.subComs ~= m;
    }
    return this;
  }

  public override Command setDescription(const string val) {
    return cast(Command) super.setDescription(val);
  }

  public override Command isRequired(const bool val) {
    return cast(Command) super.isRequired(val);
  }

  public override Command require() {
    return cast(Command) super.require();
  }

  public override Command markUsed() {
    return cast(Command) super.markUsed();
  }

  private void setParent(Command par) {
    this.par = par;
  }

  protected Command getParent() {
    return this.par;
  }
}
