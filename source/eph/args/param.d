module eph.args.param;

/**
 * Positional Parameter
 */
public class Parameter {

  private string n;

  private string desc;

  private bool   req;

  private string val;

  private bool   set;

  /**
   * Sets this parameter's display name.  Used in the
   * generation of help text.
   */
  public Parameter name(string n) {
    this.n = n;
    return this;
  }

  /**
   * Returns this parameter's display name.
   */
  public string name() const {
    return this.n;
  }

  /**
   * Sets this Parameter's description.  Used in the
   * generation of help text.
   */
  public Parameter description(string d) {
    this.desc = d;
    return this;
  }

  /**
   * Returns this Parameter's description.
   */
  public string description() const {
    return this.desc;
  }

  /**
   * Returns whether or not this Parameter has a description
   * set.
   */
  public bool hasDescription() const {
    return this.desc != "";
  }

  /**
   * Sets this Parameter as required.
   */
  public Parameter require() {
    this.req = true;
    return this;
  }

  /**
   * Returns whether or not this Parameter is required.
   */
  public bool required() const {
    return this.req;
  }

  /**
   * Returns the value parsed from the command call.
   */
  public string value() const {
    return this.val;
  }

  /**
   * Returns whether or not this Parameter was set in the
   * command call.
   */
  public bool wasSet() const {
    return this.set;
  }

  /**
   * Mark this Parameter as having been used in the command
   * call.
   */
  package void setWasSet(bool set) {
    this.set = set;
  }

  /**
   * Sets the command call value for this Parameter.
   */
  package void value(string val) {
    this.val = val;
  }
}
