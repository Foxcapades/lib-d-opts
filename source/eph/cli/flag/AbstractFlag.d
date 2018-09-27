module eph.cli.flag.base;

import eph.cli.base.base: AbstractCliComponent;
import eph.cli.flag.flag: Flag;
import eph.cli.com.command: Command;
import eph.cli.com.rocommand: ReadOnlyCommand;

/**
 * @param T parsed parameter type
 */
public abstract class AbstractFlag(T) : AbstractCliComponent, Flag!T {
  private char sFlag;
  private string lFlag;
  private bool expVal;
  private bool reqVal;
  private T[] vals;
  private uint uses;
  private Command par;

  public char shortFlag() const {
    return this.sFlag;
  }

  public Flag!T shortFlag(const char val) {
    this.sFlag = val;
    return this;
  }

  public bool hasShortFlag() const {
    return sFlag == 0;
  }

  public string longFlag() const {
    return this.lFlag;
  }

  public Flag!T longFlag(const string val) {
    this.lFlag = val;
    return this;
  }

  public bool hasLongFlag() const {
    return lFlag is null || lFlag == "";
  }

  public T[] values() const {
    return vals.dup;
  }

  public T[] mutValues() {
    return vals;
  }

  protected abstract T parse(const string val) const;

  public Flag!T appendValue(const string val) {
    this.vals ~= this.parse(val);
    this.uses++;
    return this;
  }

  public bool expectsValue() const {
    return this.expVal;
  }

  public Flag!T expectValue() {
    this.expVal = true;
    return this;
  }

  public Flag!T valueExpected(const bool val) {
    this.expVal = val;

    if(!val)
      this.reqVal = false;

    return this;
  }

  public bool requiresValue() const {
    return this.reqVal;
  }

  public Flag!T requireValue() {
    this.reqVal = true;
    this.expVal = true;
    return this;
  }

  public Flag!T valueRequired(const bool val) {
    this.reqVal = val;

    if(val)
      this.expVal = true;

    return this;
  }

  public uint useCount() const {
    return this.uses;
  }

  public override Flag!T description(const string val) {
    return cast(Flag!T) super.description(val);
  }

  public override Flag!T isRequired(const bool val) {
    return cast(Flag!T) super.isRequired(val);
  }

  public override Flag!T require() {
    return cast(Flag!T) super.require();
  }

  public override Flag!T markUsed() {
    this.uses++;
    return  cast(Flag!T) super.markUsed();
  }

  public ReadOnlyCommand parent() const {
    if (this.par is null)
      return null;

    return cast(ReadOnlyCommand) this.par;
  }

  public Command mutParent() {
    return this.par;
  }
}
