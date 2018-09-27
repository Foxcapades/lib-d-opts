module eph.cli.base.component;

import eph.cli.base.rocomponent;

/**
 * Read/Write accessor for a CLI flag or parameter.
 */
public interface CliComponent : ReadOnlyCliComponent {
  /**
   * Sets this component's description / help text.
   *
   * Text returned by this method should not be formatted,
   * it will be run through a formatter before printing to
   * the user.
   */
  public CliComponent description(const string desc);

  /**
   * Marks this component as required.
   *
   * If this component is marked as required it will trigger
   * a parser error if it is not provided in the CLI call.
   */
  public CliComponent require();

  /**
   * Sets whether or not this CLI component is required.
   *
   * If this component is marked as required it will trigger
   * a parser error if it is not provided in the CLI call.
   */
  public CliComponent isRequired(const bool req);

  /**
   * Mars this CLI component as having been used in the CLI
   * call.
   */
  public CliComponent markUsed();
}
