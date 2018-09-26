module eph.cli.parameter;

import eph.cli.component;

public interface ReadOnlyParameter(T) : ReadOnlyCliComponent {
  public string name() const;
  public T parseValue() const;
}

public interface Parameter(T) : ReadOnlyParameter!T, CliComponent {

}
