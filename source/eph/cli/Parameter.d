module eph.cli.parameter;

import eph.cli.base.rocomponent: ReadOnlyCliComponent;
import eph.cli.base.component: CliComponent;

/**
 * Read only access to a CLI positional parameter.
 *
 * @param T parameter value type
 */
public interface ReadOnlyParameter(T) : ReadOnlyCliComponent {

  /**
   * Gets the name of this positional parameter.
   *
   * Used for rendering help text and / or cli hints.
   */
  public string name() const;

  /**
   * Gets the value of this positional parameter.
   *
   * Use {@link ReadOnlyCliComponent#wasUsed()} to determine
   * whether or not this parameter contains a value.
   */
  public T value() const;
}

public interface Parameter(T) : ReadOnlyParameter!T, CliComponent {
  public Parameter!T name(const string val);
  public Parameter!T value(const string val);
}
