module eph.cli.flag.base;

import eph.cli.component;
import eph.cli.flag.flag;

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

  protected abstract override T parse(const string val) const;

  public override S appendValue(const string val) {
    this.vals ~= this.parse(val);
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
