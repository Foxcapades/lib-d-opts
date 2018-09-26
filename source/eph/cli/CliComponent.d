module eph.cli.component;

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

/**
 * Read/Write accessor for a CLI flag or parameter.
 */
public interface CliComponent(T : CliComponent) : ReadOnlyCliComponent {
  /**
   * Sets this component's description / help text.
   *
   * Text returned by this method should not be formatted,
   * it will be run through a formatter before printing to
   * the user.
   */
  public CliComponent!T description(const string desc);

  /**
   * Marks this component as required.
   *
   * If this component is marked as required it will trigger
   * a parser error if it is not provided in the CLI call.
   */
  public CliComponent!T require();

  /**
   * Sets whether or not this CLI component is required.
   *
   * If this component is marked as required it will trigger
   * a parser error if it is not provided in the CLI call.
   */
  public CliComponent!T isRequired(const bool req);

  /**
   * Mars this CLI component as having been used in the CLI
   * call.
   */
  public CliComponent!T markUsed();
}

/**
 * Base implementation of a CLI component.
 *
 * @param T extending type.  Used for return types on
 *          chainable methods.
 */
public abstract class AbstractCliComponent(T : AbstractCliComponent) : CliComponent!T {
  private string desc;
  private bool req;
  private bool used;

  public override string description() const {
    return desc;
  }

  public override T description(const string val) {
    this.desc = val;
    return cast(T) this;
  }

  public override bool isRequired() const {
    return req;
  }

  public override T isRequired(const bool val) {
    this.req = val;
    return cast(T) this;
  }

  public override T require() {
    this.req = true;
    return cast(T) this;
  }

  public override bool wasUsed() const {
    return this.used;
  }

  public override T markUsed() {
    this.used = true;
    return cast(T) this;
  }
}