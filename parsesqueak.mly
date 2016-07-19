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
	| /* epsilon */ { new Node.node Empty Empty }
	;

num_list:
	num { new Node.node Empty $1 }
	| num num_list { new Node.node $2 $1 }
	;

num:
	INT { Int_lit $1 }
	| FLOAT { Float_lit $1 }
	;

%%