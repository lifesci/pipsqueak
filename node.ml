open Printf

type node_types = Int_lit of int
	| Float_lit of float
	| String_lit of string
	| Empty;;

class node input child =
	object (self)
		val mutable contents = input
		val mutable next = child

		method print_contents = match contents with
		Int_lit x -> Printf.printf "%i\n" x
		| Float_lit x -> Printf.printf "%f\n" x
		| String_lit x -> Printf.printf "%s\n" x
		| Empty -> ()

		method print = match next with
		None -> self#print_contents
		| Some x -> self#print_contents; x#print
	end;;