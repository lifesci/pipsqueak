%{
	open Node
%}

%token <int> INT
%token <float> FLOAT
%token EOF

%start prog
%type <Node.node> prog

%%

prog:
	num_list { $1 }
	| EOF { new Node.node Empty Empty }
	;

num_list:
	num { new Node.node $1 (new Node.node Empty Empty) }
	| num num_list { new Node.node $1 $2 }
	;

num:
	INT { Int_lit $1 }
	| FLOAT { Float_lit $1 }
	;

%%