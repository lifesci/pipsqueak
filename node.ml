type node_types = Int_lit of int
	| Float_lit of float
	| Empty;;

class node child input =
	object
		val mutable contents = input
		val mutable next = child

	end;;