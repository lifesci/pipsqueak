%{
	open Node
%}

%token <int> INT_LIT
%token <float> FLOAT_LIT
%token L_SQUARE
%token R_SQUARE
%token L_PAREN
%token R_PAREN
%token EOF

%start prog
%type <Node.node option> prog

%%

prog:
	num_list { $1 }
	| EOF { None }
	;

num_list:
	num { Some (new Node.node $1 None) }
	| num num_list { Some (new Node.node $1 $2) }
	;

num:
	INT_LIT { Int_lit $1 }
	| FLOAT_LIT { Float_lit $1 }
	;

%%