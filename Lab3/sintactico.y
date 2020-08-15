%{
	#include <stdio.h>
	#include <stdlib.h>
	#define BREAK break;
	void yyerror(char *s);
	extern int yylineno; 
	extern FILE* yyin;
	extern int yylex () ;
	
%}

%token TOKEN_PUNTO
%token TOKEN_COMA
%token TOKEN_PUNTO_Y_COMA
%token TOKEN_IGUAL
%token TOKEN_MAS
%token TOKEN_MENOS
%token TOKEN_MULTIPLICADOR
%token TOKEN_DIVISOR
%token TOKEN_PARENT_DERECHO
%token TOKEN_PARENT_IZQUIERDO
%token TOKEN_HASHTAG
%token TOKEN_MENOR
%token TOKEN_MAYOR
%token TOKEN_DEFINE
%token TOKEN_IF
%token TOKEN_DO
%token TOKEN_MAYOR_IGUAL
%token TOKEN_MENOR_IGUAL
%token TOKEN_VAR
%token TOKEN_END
%token TOKEN_ODD
%token TOKEN_CALL
%token TOKEN_THEN
%token TOKEN_CONST
%token TOKEN_BEGIN
%token TOKEN_WHILE
%token TOKEN_PROCEDURE
%token TOKEN_IDENTIFICADOR
%token TOKEN_NUMERO

%%
programa: bloque TOKEN_PUNTO;

bloque: A B C instruccion;

A: TOKEN_CONST D TOKEN_PUNTO_Y_COMA | ;

B: TOKEN_VAR E TOKEN_PUNTO_Y_COMA | ;

C: TOKEN_PROCEDURE TOKEN_IDENTIFICADOR TOKEN_PUNTO_Y_COMA bloque TOKEN_PUNTO_Y_COMA C | ;

D: TOKEN_IDENTIFICADOR TOKEN_IGUAL TOKEN_NUMERO TOKEN_COMA D | TOKEN_IDENTIFICADOR TOKEN_IGUAL TOKEN_NUMERO;

E: TOKEN_IDENTIFICADOR TOKEN_COMA E | TOKEN_IDENTIFICADOR;

instruccion: TOKEN_IDENTIFICADOR TOKEN_DEFINE expresion | TOKEN_CALL TOKEN_IDENTIFICADOR | TOKEN_BEGIN instruccion F TOKEN_END | TOKEN_IF condicion TOKEN_THEN instruccion | TOKEN_WHILE condicion TOKEN_DO instruccion | 

F: TOKEN_PUNTO_Y_COMA instruccion F | ;

expresion: G termino H;

G: TOKEN_MAS | TOKEN_MENOS | ;

H: TOKEN_MAS termino H | TOKEN_MENOS termino H | ;

termino: factor K;

K: TOKEN_MULTIPLICADOR factor K | TOKEN_DIVISOR factor K | ;

factor: TOKEN_IDENTIFICADOR | TOKEN_NUMERO | TOKEN_PARENT_IZQUIERDO expresion TOKEN_PARENT_DERECHO;

condicion: TOKEN_ODD expresion | expresion TOKEN_IGUAL expresion | expresion TOKEN_HASHTAG expresion | expresion TOKEN_MENOR expresion | expresion TOKEN_MENOR_IGUAL expresion | expresion TOKEN_MAYOR expresion | expresion TOKEN_MAYOR_IGUAL expresion;

%%
void yyerror(char *s){
	printf("Error sint%cctico en la l%cnea: %d\n",160,161,yylineno);
	exit(1);
}

int main(int argc, char const *argv[])
{
	switch(argc){

		case 1:
			printf("Error: Falta par%cmetro en la l%cnea de comandos.\n",160,161);
			printf("Uso: sintactico.exe archivo\n");
			BREAK
		case 2:

			yyin= fopen(argv[1],"rb");
			//no es necesario cerrar archivo abierto ya que flex lo hace

			if (yyin) // se comprueba que exista el puntero con el archivo abierto
			{
				if(yyparse()!=1){
					printf("An%clisis sint%cctico concluido.\n",160,160);
				}
			}
			else
			{
				printf("Error: El archivo de entrada no existe.\n");
			}
			BREAK

		default:
			if (argc > 2 )
			{
				printf("Error: Demasiados par%cmetros en la l%cnea de comandos.\n",160,161);
				printf("Uso: sintactico.exe archivo\n");
			}
			BREAK
	}
	return 0;
}
