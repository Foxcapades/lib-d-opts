module eph.args.arg;

import eph.args.param: Parameter;

/**
 * CLI Argument / Flag
 *
 * Represents a unique cli flag that can have a short and/or long form.
 */
public class Argument {

  private char sFlag;

  private string lFlag;

  private string desc;

  private bool isRequired;

  private bool hasParam;

  private bool isParamRequired;

  private uint hits;

  private string[] vals;

  /**
   * Sets this argument's short flag.
   * Returns the current Argument instance.
   */
  public Argument shortFlag(char c) {
    sFlag = c;
    return this;
  }

  /**
   * Returns this argument's short flag
   */
  public char shortFlag() const {
    return sFlag;
  }

  /**
   * Returns whether or not this argument has a short flag
   * set.
   */
  public bool hasShortFlag() const {
    return sFlag == 0;
  }

  /**
   * Sets this argument's long flag.
   * Returns the current Argument instance.
   */
  public Argument longFlag(string l) {
    lFlag = l;
    return this;
  }

  /**
   * Returns this argument's long flag.
   */
  public string longFlag() const {
    return lFlag;
  }

  /**
   * Returns whether or not this argument has a long flag
   * set.
   */
  public bool hasLongFrom() const {
    return lFlag != "";
  }

  /**
   * Sets this argument as required.
   */
  public Argument require() {
    isRequired = true;
    return this;
  }

  /**
   * Returns whether or not this argument is required.
   */
  public bool required() const {
    return isRequired;
  }

  /**
   * Sets this argument to require a parameter value.
   */
  public Argument requireParam() {
    hasParam = true;
    isParamRequired = true;
    return this;
  }

  /**
   * Whether or not this argument requires a parameter
   * value.
   */
  public bool paramRequired() const {
    return isParamRequired;
  }

  /**
   * Sets this argument to expect an optional value
   * parameter.
   */
  public Argument optionalParam() {
    hasParam = true;
    isParamRequired = false;
    return this;
  }

  /**
   * Returns whether this argument has a parameter which is
   * optional.
   */
  public bool hasOptionalParam() const {
    return hasParam && !this.isParamRequired;
  }

  /**
   * Returns whether or not this argument expects a value
   * parameter.
   */
  public bool parameterized() const {
    return hasParam;
  }

  /**
   * Set this argument's description
   */
  public Argument description(string d) {
    desc = d;
    return this;
  }

  /**
   * Get this argument's description.
   */
  public string description() const {
    return desc;
  }

  /**
   * Whether or not this argument has a description set.
   */
  public bool hasDescription() const {
    return desc != "";
  }

  /**
   * Get values passed to this argument from each usage on
   * the command line.
   */
  public string[] values() {
    return vals;
  }

  /**
   * Get number of times this argument was used
   */
  public uint uses() const {
    return hits;
  }

  /**
   * Get whether or not this flag was used
   */
  public bool set() const {
    return hits > 0;
  }

  /**
   * Appends a parameter value to this argument.
   */
  package void value(string val) {
    vals ~= val;
  }

  /**
   * Marks this Argument has having been used.
   * Additionally increments the internal usage counter.
   */
  package void use() {
    hits++;
  }
}
