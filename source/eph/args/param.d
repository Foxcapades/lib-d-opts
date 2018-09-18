module eph.args.param;

public class Parameter {

  private string n;

  private string desc;

  private bool   req;

  private string val;

  private bool   set;

  public Parameter name(string n) {
    this.n = n;
    return this;
  }

  public string name() const {
    return this.n;
  }

  public Parameter description(string d) {
    this.desc = d;
    return this;
  }

  public string description() const {
    return this.desc;
  }

  public bool hasDescription() const {
    return this.desc != "";
  }

  public Parameter require() {
    this.req = true;
    return this;
  }

  public bool required() const {
    return this.req;
  }

  public string value() const {
    return this.val;
  }

  public bool wasSet() const {
    return this.set;
  }

  package void setWasSet(bool set) {
    this.set = set;
  }

  package void value(string val) {
    this.val = val;
  }
}
