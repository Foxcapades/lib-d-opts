module eph.cli.command;

import eph.cli.sub: SubCommand;
import eph.cli.args.arg: Argument;
import eph.cli.args.param: Parameter;

public interface CliError(T) {
  public T source() const;
}

public interface CliComponent {
  public string description() const;
}

public interface ParamParser(T) {
  public T parse(const string val) const;
}

public interface ReadOnlyParameter(T) : CliComponent {
  public string name() const;
  public T parseValue()
}
public interface Parameter {}

public interface Arguments {
  public Flag[] usedFlags() const;
  public Flag[] unusedFlags() const;

  public Parameter[] usedParams() const;
  public Parameter[] unusedParams() const;

  public bool hasErrors() const;
  public
}

public interface Command {
  public
  public int run();
}

public abstract class SimpleCommand {
  private const string name;
  private string desc;
  private Argument[] args;
  private Parameter[] params;
  private SubCommand sub;

  this(
    const string name,
    string desc = "",
    SubCommand sub = null,
    Argument[] args... = []
  ) {
    this.name = name;
    this.desc = desc;
    this.args = args;
    this.sub  = sub;
  }

  public string getName() const {
    return this.name;
  }

  public Command setDescription(string desc) {
    this.desc = desc;
    return this;
  }

  public string getDescription() const {
    return this.desc;
  }

  public Command appendArgs(Argument[] args...) {
    this.args ~= args;
    return this;
  }

  public Command setArgs(Argument[] args) {
    this.args = args;
    return this;
  }

  public Argument[] getArgs() const {
    return this.args;
  }

  public Command appendParams(Parameter[] params...) {
    this.params ~= params;
  }

  public Command setParams(Parameter[] params) {
    this.params = params;
    return this;
  }

  public Parameter[] getParams() const {
    return this.params;
  }

  public Command setSubCommand(SubCommand com) {
    this.sub = com;
    return this;
  }

  public SubCommand getSubCommand() const {
    return this.sub;
  }

  public abstract parse(const string[] args);

  public abstract run() const;
}
