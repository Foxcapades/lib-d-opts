import std.stdio;

import eph.args;

void main(const string[] args)
{
  Argument  count = new Argument().shortFlag('c');
  Argument  flag  = new Argument().longFlag("flag").shortFlag('f').requireParam();
  Parameter param = new Parameter();
  ArgParser parse = new ArgParser().register(count, flag).register(param);

  parse.parse(args);

  writefln("count: %d", count.uses());
  writefln("flag: %s", flag.values());
  writefln("param: %s", param.value());
  writefln("extra (unknown values): %s", parse.remainder());
  writefln("passthrough: %s", parse.passthrough());
}
