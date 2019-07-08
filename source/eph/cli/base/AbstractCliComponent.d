module eph.cli.base.base;

import eph.cli.base.component;

/**
 * Base implementation of a CLI component.
 */
public abstract class AbstractCliComponent
// implements
: CliComponent
{
  private string desc;
  private bool req;
  private bool used;

  /*⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺*\
  ▏                                                        ▕
  ▏ Default implementations of interface methods.          ▕
  ▏                                                        ▕
  \*⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯*/

  public string getDescription() const
  { return desc; }

  public T setDescription(this T)(const string val)
  in(val !is null)
  {
    this.desc = val;
    return this;
  }

  public bool isRequired() const
  { return req; }

  public T isRequired(this T)(const bool val)
  {
    this.req = val;
    return this;
  }

  public T require(this T)()
  {
    this.req = true;
    return this;
  }

  public bool wasUsed() const
  { return this.used; }

  // CliComponent::markUsed
  public T markUsed(this T)()
  {
    this.used = true;
    return this;
  }
}
