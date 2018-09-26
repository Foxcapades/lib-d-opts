module eph.cli.flag;

import eph.cli.component;

/**
 * Read only access to a CLI flag.
 *
 * @param T flag value type
 */
public interface ReadOnlyFlag(T) : ReadOnlyCliComponent {
  /**
   * Gets the short form set on this cli flag.
   */
  public char shortFlag() const;

  /**
   * Gets whether or not this cli flag has a short form.
   */
  public bool hasShortFlag() const;

  /**
   * Gets the long form set on this cli flag.
   */
  public string longFlag() const;

  /**
   * Gets whether or not this cli flag has a long form.
   */
  public bool hasLongFlag() const;

  /**
   * Gets the values passed for this flag in the CLI call.
   */
  public T[] values() const;

  /**
   * Gets whether or not this CLI flag expects a value.
   */
  public bool expectsValue() const;

  /**
   * Gets whether or not this CLI flag requires a value.
   *
   * If this returns true, expectsValue() must also return
   * true.
   */
  public bool requiresValue() const;

  /**
   * Gets the number of times this flag was used in the CLI
   * call.
   */
  public uint useCount() const;
}

/**
 * Read / Write access to a CLI flag.
 *
 * @param T flag value type
 * @param S extending type
 */
public interface Flag(T, S : Flag!(T, S)) : ReadOnlyFlag!T, CliComponent!S {

  /**
   * Sets the short form for this CLI flag.
   */
  public S shortFlag(const char c);

  /**
   * Sets the long form for this CLI flag.
   */
  public S longFlag(const char c);

  /**
   * Sets this flag as requring a value.
   *
   * This will also mark this CLI flag as expecting a value.
   */
  public S requireValue();

  /**
   * Sets whether or not this flag requires a value.
   *
   * Setting this value to true will also mark this value
   * as expecting a value.
   *
   * Setting this value to false will not stop this flag
   * from expecting a value.
   */
  public S valueRequired(const bool val);

  /**
   * Marks this flag as expecting a value.
   */
  public S expectValue();

  /**
   * Sets whether or not this flag expects a value.
   *
   * Setting this value to false will also disable the
   * require value setting.
   */
  public S valueExpected(const bool val);

  /**
   * Appends a value to the internal value collection for
   * this flag.
   */
  public S appendValue(const string val);
}

/**
 * @param T parsed parameter type
 * @param S extending class type
 */
public abstract class AbstractFlag(T, S : AbstractFlag!(T, S)) : AbstractCliComponent!(Flag!T), Flag!T {
  private char sFlag;
  private string lFlag;
  private bool expVal;
  private bool reqVal;
  private T[] vals;
  private uint uses;

  public override char shortFlag() const {
    return this.sFlag;
  }

  public override S shortFlag(const char val) {
    this.sFlag = val;
    return cast(S) this;
  }

  public override bool hasShortFlag() const {
    return sFlag == 0;
  }

  public override string longFlag() const {
    return this.lFlag;
  }

  public override S longFlag(const string val) {
    this.lFlag = val;
    return cast(S) this;
  }

  public override bool hasLongFlag() const {
    return lFlag is null || lFlag == "";
  }

  public override T[] values() const {
    return vals;
  }

  public override S appendValue(const T val) {
    this.vals ~= val;
    this.uses++;
    return cast(S) this;
  }

  public override bool expectsValue() const {
    return this.expVal;
  }

  public override S expectValue() {
    this.expVal = true;
    return cast(S) this;
  }

  public override S valueExpected(const bool val) {
    this.expVal = val;

    if(!val)
      this.reqVal = false;

    return cast(S) this;
  }

  public override bool requiresValue() const {
    return this.reqVal;
  }

  public override S requireValue() {
    this.reqVal = true;
    this.expVal = true;
    return cast(S) this;
  }

  public override S valueRequired(const bool val) {
    this.reqVal = val;

    if(val)
      this.expVal = true;

    return cast(S) this;
  }

  public override uint useCount() const {
    return this.uses;
  }

  public override S markUsed() {
    this.uses++;
    return super.markUsed();
  }
}

/**
 * A flag
 */
public class SwitchFlag : AbstractFlag!bool {}

public class IntFlag : Flag!int {

}