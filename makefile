run:
	ocamlbuild -use-ocamlfind lexsqueak.cmo parsesqueak.cmo
	corebuild -use-ocamlfind main.cmo
	corebuild -use-ocamlfind main.native
	mv main.native pipsqueak

clean:
	rm pipsqueak _build/*