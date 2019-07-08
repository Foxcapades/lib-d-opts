module eph.cli.base.component;

import eph.cli.base.rocomponent;

/**
 * Read/Write accessor for a CLI flag or parameter.
 */
public interface CliComponent
: ConstCliComponent
{

  /**
   * Sets this component's description / help text.
   *
   * Text returned by this method should not be formatted,
   * it will be run through a formatter before printing to
   * the user.
   */
  public T setDescription(this T)(const string desc);

  /**
   * Marks this component as required.
   *
   * If this component is marked as required it will trigger
   * a parser error if it is not provided in the CLI call.
   */
  public T require(this T)();

  /**
   * Sets whether or not this CLI component is required.
   *
   * If this component is marked as required it will trigger
   * a parser error if it is not provided in the CLI call.
   */
  public T isRequired(this T)(const bool req);

  /**
   * Marks this CLI component as having been used in the CLI
   * call.
   */
  public T markUsed(this T)();
}
