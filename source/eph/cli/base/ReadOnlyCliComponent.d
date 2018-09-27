module eph.cli.base.rocomponent;

/**
 * Read only representation of a CLI flag or parameter.
 */
public interface ReadOnlyCliComponent {
  /**
   * Gets this component's description / help text.
   *
   * Text returned by this method should not be formatted,
   * it will be run through a formatter before printing to
   * the user.
   */
  public string description() const;

  /**
   * Gets whether or not this CLI component is required.
   *
   * If this component is marked as required it will trigger
   * a parser error if it is not provided in the CLI call.
   */
  public bool isRequired() const;

  /**
   * Gets whether or not this CLI component was used in the
   * CLI call.
   */
  public bool wasUsed() const;
}
