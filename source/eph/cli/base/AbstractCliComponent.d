module eph.cli.base.base;

import eph.cli.base.component;

/**
 * Base implementation of a CLI component.
 */
public abstract class AbstractCliComponent : CliComponent {
  private string desc;
  private bool req;
  private bool used;

  public string description() const {
    return desc;
  }

  public CliComponent description(const string val) {
    this.desc = val;
    return this;
  }

  public bool isRequired() const {
    return req;
  }

  public CliComponent isRequired(const bool val) {
    this.req = val;
    return this;
  }

  public CliComponent require() {
    this.req = true;
    return this;
  }

  public bool wasUsed() const {
    return this.used;
  }

  public CliComponent markUsed() {
    this.used = true;
    return this;
  }
}