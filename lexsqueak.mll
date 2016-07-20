{
	open Lexing
	open Parsesqueak
	open String

	exception SyntaxError of string
	exception Eof
}

let space = [' ' '\t' '\n' '\r']+
let int_lit = '-'?['1'-'9']['0'-'9']*
let float_lit = ((int_lit|'0')?'.'['0'-'9']+) | ((int_lit|'0')'.'['0'-'9']*)
let string_lit = '"'[^' ' '\t' '\n' '\r']*'"'
let id = ['a'-'z''A'-'Z']+['a'-'z''A'-'Z''0'-'9''_']*

rule token = parse
	| space { token lexbuf }

	| int_lit as lxm { INT_LIT (int_of_string (lxm)) }
	| float_lit as lxm { FLOAT_LIT (float_of_string (lxm)) }

	| '[' { L_SQUARE }
	| ']' { R_SQUARE }
	| '(' { L_PAREN }
	| ')' { R_PAREN }

	| '=' { EQUALS }
	| '+' { PLUS }
	| '-' { MINUS }
	| '*' { MUL }
	| '/' { DIV }

	| eof { EOF }
	
	| _ as other { raise (SyntaxError ("Unexpected character: " ^ (String.make 1 other) ^ "\n")) }