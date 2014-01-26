AssemblyWriter
==============

A Ruby interpreter for MIPS Assembly Language using a pseudolanguage currently dubbed RTFM (Ruby To Functional MIPS)(=p).

Just a simple open project to make an easier way to do basic MIPS programs, with an open goal to allow more complex features in the future.

MIPS generated here is tested using Missouri State's MARS emulator: http://courses.missouristate.edu/kenvollmar/mars/ 

SYNTAX:
**Very early in development
**Commands -MUST- be capitalized

PRINTS(str) - print string 'str'

PRINTI(var) - print int 'var'

DEFINE(varname, str) - defines 'str' as 'varname' at beginning of file *works anywhere in file*

VAR(varname, int) - defines a variable 'varname' as 'int'

LOOP(loopname) - creates a loopback point for commands such as 'goiflt'

ADD(var, int) - adds int to var

SUB(var, int) - subtracts int from var

MULT(var, int) - multiplies var by int

DIV(var, int) - divides var by int

GOIFLT(loopname, var, int) - go to loopname if var is less than int

GOIFEQ(loopname, var, int) - go to loopname if var is equal than int

GOIFGT(loopname, var, int) - go to loopname if var is greater than int

**Program ends on its own at EOF
