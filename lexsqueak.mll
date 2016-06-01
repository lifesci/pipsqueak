{
	open Lexing
	open Parsesqueak

	exception SyntaxError of char
	exception Eof
}

let int = '-'?['1'-'9']['0'-'9']*
let float = ['0'-'9']+'.'['0'-'9']+
let space = [' ' '\t' '\n' '\r']+

rule token = parse
	| space { token lexbuf }
	| int as lxm { INT (int_of_string (lxm)) }
	| float as lxm { FLOAT (float_of_string (lxm)) }
	| eof { raise Eof }
	| _ as other { raise (SyntaxError other) }