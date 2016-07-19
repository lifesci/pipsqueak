%{
	open Node
%}

%token <int> INT
%token <float> FLOAT
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
	INT { Int_lit $1 }
	| FLOAT { Float_lit $1 }
	;

%%