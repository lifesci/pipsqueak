
%token <int> INT
%token <float> FLOAT
%token EOF

%start prog
%type <int> prog
%%

prog:
	num_list { 1 }
	;

num_list:
	num { $1 }
	| num num_list { $1 }
	;

num:
	FLOAT { print_float $1; int_of_float $1 }
	| INT { print_int $1; $1 }
	;

%%