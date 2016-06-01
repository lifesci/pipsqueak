run:
	ocamllex lexsqueak.mll
	ocamlyacc parsesqueak.mly
	ocamlc -c parsesqueak.mli
	ocamlc -c lexsqueak.ml
	ocamlc -c parsesqueak.ml
	ocamlfind ocamlc -linkpkg -thread -package core -c main.ml
	ocamlfind ocamlc -linkpkg -thread -package core -o pipsqueak lexsqueak.cmo parsesqueak.cmo main.cmo

clean:
	rm pipsqueak lexsqueak.ml parsesqueak.ml *.cmi *.cmo *.mli