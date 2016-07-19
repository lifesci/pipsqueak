open Core.Std
open Lexsqueak
open Lexing

let rec parse lexbuf =
	try Parsesqueak.prog Lexsqueak.token lexbuf with
	| SyntaxError msg ->
		print_string "syntax error\n"; exit 0
	| Eof ->
		exit 0

let loop filename =
	let inx = In_channel.create filename in
		let lexbuf = Lexing.from_channel inx in
			let x = parse lexbuf in
				In_channel.close inx;;

loop Sys.argv.(1)