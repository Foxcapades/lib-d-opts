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

  public Argument shortFlag(char c) {
    sFlag = c;
    return this;
  }

  public char shortFlag() const {
    return sFlag;
  }

  public bool hasShortFlag() const {
    return sFlag == 0;
  }

  public Argument longFlag(string l) {
    lFlag = l;
    return this;
  }

  public string longFlag() const {
    return lFlag;
  }

  public bool hasLongFrom() const {
    return lFlag != "";
  }

  public Argument require() {
    isRequired = true;
    return this;
  }

  public bool required() const {
    return isRequired;
  }

  public Argument requireParam() {
    hasParam = true;
    isParamRequired = true;
    return this;
  }

  public bool paramRequired() const {
    return isParamRequired;
  }

  public Argument optionalParam() {
    hasParam = true;
    isParamRequired = false;
    return this;
  }

  public bool hasOptionalParam() const {
    return hasParam && !this.isParamRequired;
  }

  public bool parameterized() const {
    return hasParam;
  }

  public Argument description(string d) {
    desc = d;
    return this;
  }

  public string description() const {
    return desc;
  }

  public bool hasDescription() const {
    return desc != "";
  }

  public string[] values() {
    return vals;
  }

  public uint uses() const {
    return hits;
  }

  public bool set() const {
    return hits > 0;
  }

  package void value(string val) {
    vals ~= val;
  }

  package void use() {
    hits++;
  }
}
