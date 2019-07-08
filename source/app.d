import std.stdio;

import eph.cli.com: AbstractCommand;
import eph.cli.flag: BoolFlag;


private class Foo
// extends
: AbstractCommand {
  public this() {
    this.append(
      new BoolFlag()
    );
  }

  public int run()
  {

  }
}

void main(const string[] args)
{
  new App().setCommand(new Foo).run;
}
