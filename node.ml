open Printf

type node_types = Int_lit of int
	| Float_lit of float
	| String_lit of string
	| Empty;;

class node input child =
	object (self)
		val mutable contents = input
		val mutable next = child
		method print = match next with
			| Empty -> self#print_contents;
			| _ -> self#print_contents; next#print;
		method print_contents = print_string "here"
	end;;