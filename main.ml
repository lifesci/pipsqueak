open Core.Std
open Lexsqueak
open Lexing

let rec parse lexbuf =
	try Parsesqueak.prog Lexsqueak.token lexbuf with
	| SyntaxError msg ->
		print_string "here syntax\n"; exit 0
	| Eof ->
		print_string "here eof\n"; exit 0

let loop filename =
	print_string (filename^"\n");
	let inx = In_channel.create filename in
	let lexbuf = Lexing.from_channel inx in
	parse lexbuf;
	In_channel.close inx;;

loop Sys.argv.(1)