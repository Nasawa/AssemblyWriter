AssemblyWriter
==============

A Ruby interpreter for MIPS Assembly Language using a pseudolanguage currently dubbed RTFM (Ruby To Functional MIPS)(=p).

Just a simple open project to make an easier way to do basic MIPS programs, with an open goal to allow more complex features in the future.

MIPS generated here is tested using Missouri State's MARS emulator: http://courses.missouristate.edu/kenvollmar/mars/ 

SYNTAX:
**Very early in development
**Commands -MUST- be capitalized

; - Any semicolon without text before it will create a blank space between commands

PRINTS(str) - print string 'str'

PRINTI(var) - print int 'var'

PRINTL(literal) - prints text 'literal' such as comments or personalized code

DEFINE(varname, str) - defines 'str' as 'varname' at beginning of file *works anywhere in file*

VAR(varname, int) - defines a variable 'varname' as 'int'

LOOP(loopname) - creates a loopback point for commands such as 'goiflt'

ADD(var, var | int) - adds var/int to var

SUB(var, var | int) - subtracts var/int from var

MULT(var, var | int) - multiplies var by var/int

DIV(var, var | int) - divides var by var/int

GOIFLT(loopname, var, int) - go to loopname if var is less than int

GOIFEQ(loopname, var, int) - go to loopname if var is equal than int

GOIFGT(loopname, var, int) - go to loopname if var is greater than int

**Program ends on its own at EOF
