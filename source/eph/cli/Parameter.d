module eph.cli.parameter;

import eph.cli.base.rocomponent: ConstCliComponent;
import eph.cli.base.component: CliComponent;

/**
 * Non-template, collection safe {@ConstParameter}
 * definition.
 */
public interface CollectibleConstParameter
// extends
: ConstCliComponent
{
  /**
   * Gets the name of this positional parameter.
   *
   * Used for rendering help text and / or cli hints.
   */
  public string name() const;
}

/**
 * Read only access to a CLI positional parameter.
 *
 * @param T parameter value type
 */
public interface ReadOnlyParameter(T):
  // extends
  CollectibleConstParameter
{

  /**
   * Gets the value of this positional parameter.
   *
   * Use {@link ReadOnlyCliComponent#wasUsed()} to determine
   * whether or not this parameter contains a value.
   */
  public T value() const;
}

/**
 * Non-template, collection safe {@Parameter} definition.
 */
public interface CollectibleParameter
// extends
: CollectibleConstParameter
{
  /**
   * Sets this Parameter's name.
   */
  public CollectibleParameter name(const string val);

  /**
   * Sets this Parameter's value.
   *
   * This method will not mark this parameter as used.
   */
  public CollectibleParameter value(const string val);
}

public interface Parameter(T)
// extends
: CollectibleParameter
, ReadOnlyParameter!T
, CliComponent
{
}
