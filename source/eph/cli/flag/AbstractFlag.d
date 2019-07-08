module eph.cli.flag.base;

import eph.cli.base.base: AbstractCliComponent;
import eph.cli.flag.flag: Flag;
import eph.cli.com.command: Command;
import eph.cli.com.rocommand: ConstCommand;

/**
 * @param T parsed parameter type
 */
public abstract class AbstractFlag(T)
// extends
: AbstractCliComponent
// implements
, Flag!T
{
  private char sFlag;

  private string lFlag;

  private bool expVal;

  private bool reqVal;

  private T[] vals;

  private uint uses;

  private Command par;

  /*⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺*\
  ▏                                                        ▕
  ▏ Abstract methods not defined in the interface.         ▕
  ▏                                                        ▕
  \*⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯*/

  /**
   * Parse the input string from the CLI into a value of
   * type T.
   */
  protected abstract T parse(const string val) const;

  /**
   * Marks this Flag as having been used.  Additionally
   * increments the use counter for this flag.
   */
  public override R markUsed(this R)()
  {
    this.uses++;
    return super.markUsed();
  }

  /*⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺*\
  ▏                                                        ▕
  ▏ Default implementations of interface methods.          ▕
  ▏                                                        ▕
  \*⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯*/

  public char getShortFlag() const
  { return this.sFlag; }

  public Flag!T setShortFlag(const char val)
  {
    this.sFlag = val;
    return this;
  }

  public bool hasShortFlag() const
  { return sFlag == 0; }

  public string getLongFlag() const
  { return this.lFlag; }

  public Flag!T setLongFlag(const string val)
  in {
    assert(val !is null);
  }
  do {
    this.lFlag = val;
    return this;
  }

  public bool hasLongFlag() const
  { return lFlag is null || lFlag == ""; }

  public T[] getValues() const
  { return vals.dup; }

  public T[] getMutValues()
  { return vals; }

  public Flag!T appendValue(const string val)
  in {
    assert(val !is null);
  }
  do {
    this.vals ~= this.parse(val);
    this.uses++;
    return this;
  }

  public bool expectsValue() const
  { return this.expVal; }

  public Flag!T expectValue()
  {
    this.expVal = true;
    return this;
  }

  public Flag!T setValueExpected(const bool val)
  {
    this.expVal = val;

    if(!val)
      this.reqVal = false;

    return this;
  }

  public bool requiresValue() const
  { return this.reqVal; }

  public Flag!T requireValue()
  {
    this.reqVal = true;
    this.expVal = true;
    return this;
  }

  public Flag!T setValueRequired(const bool val)
  {
    this.reqVal = val;

    if(val)
      this.expVal = true;

    return this;
  }

  public uint useCount() const
  { return this.uses; }

  public ConstCommand getParent() const
  { return cast(ConstCommand) this.par; }

  // Command::getMutParent
  public Command getMutParent()
  { return this.par; }
}
