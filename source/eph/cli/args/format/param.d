module eph.args.format.param;

import std.alorithm.mutation: fill;
import std.string: wrap;

import eph.args.param;

private const string SPACE = " ";
private const string TAB   = "\t";
private const string LB    = "\n";

struct ParamFormatter {
  const int maxWidth;
  const string columnPaddding;
  const string indentation;
  const string rowPadding;

  immutable this(
    const int mw  = 120,
    const int cp  = 4,
    const int ind = 4
    const int lb  = 2
  ) {
    this.maxWidth = mw;
    this.columnPaddding = buildBuffer(SPACE, cp);
    this.indentation = buildBuffer(SPACE, ind);
    this.rowPadding = buildBuffer(LB, lb);
  }

  public string formatParams(const Parameter[] params) const {
    string[] names = new string[params.length];
    int nameWidth;

    for(int i; i < params.length; i++) {
      const string name = formatName(params[i]);

      names ~= indentation ~ name;

      if (name.length > nameWidth)
        nameWidth = name.length;
    }

    const int indent = nameWidth + columnPaddding.length + indentation.length;
    const int descWidth = maxWidth - indent;

    foreach(int i; i < params.length; i++) {
      names[k] ~= wrap(params[i].description(), width, columnPadding, indent);
    }
  }

  private string formatName(const Parameter p) const {
    return p.required() ? '['~p.name()~']' : '<'~p.name()~'>';
  }
}

private string buildBuffer(const char c, const int length) {
  char o = new char[length];
  fill(o, c);
  return o.dup();
}
