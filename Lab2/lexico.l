%{

/* #######################################
   #        ESPACIO DE DEFINICIONES      #
   ####################################### */
	#include <stdio.h>
	#include <stdlib.h>
	#define BREAK break;
	
%}



letra [a-zA-Z] 
/* una letra */
digito [0-9] 
/* un digito */
saltoLinea [\r\n]* 
/* el caracter de salto de linea '\n' en clausura */
NUMERO ({digito})+ 
/* un digito en clausura positiva  */
IDENTIFICADOR {letra}({letra}|{digito})* 
/* una letra concatenado a una letra o digito en clausura */
SPACE " " 
/* espacio */

%%


"." {fprintf(yyout,"%s\n",yytext);}
"," {fprintf(yyout,"%s\n",yytext);}
";" {fprintf(yyout,"%s\n",yytext);}
"=" {fprintf(yyout,"%s\n",yytext);}
"+" {fprintf(yyout,"%s\n",yytext);}
"-" {fprintf(yyout,"%s\n",yytext);}
"*" {fprintf(yyout,"%s\n",yytext);}
"/" {fprintf(yyout,"%s\n",yytext);}
"(" {fprintf(yyout,"%s\n",yytext);}
")" {fprintf(yyout,"%s\n",yytext);}
"#" {fprintf(yyout,"%s\n",yytext);}
"<" {fprintf(yyout,"%s\n",yytext);}
">" {fprintf(yyout,"%s\n",yytext);}
":=" {fprintf(yyout,"%s\n",yytext);}
"if" {fprintf(yyout,"%s\n",yytext);}
"do" {fprintf(yyout,"%s\n",yytext);}
"<=" {fprintf(yyout,"%s\n",yytext);}
">=" {fprintf(yyout,"%s\n",yytext);}
"var" {fprintf(yyout,"%s\n",yytext);}
"end" {fprintf(yyout,"%s\n",yytext);}
"odd" {fprintf(yyout,"%s\n",yytext);}
"call" {fprintf(yyout,"%s\n",yytext);}
"then" {fprintf(yyout,"%s\n",yytext);}
"const" {fprintf(yyout,"%s\n",yytext);}
"begin" {fprintf(yyout,"%s\n",yytext);}
"while" {fprintf(yyout,"%s\n",yytext);}
"procedure" {fprintf(yyout,"%s\n",yytext);}


{IDENTIFICADOR} {fprintf(yyout,"IDENTIFICADOR\n");}
{NUMERO} {fprintf(yyout,"NUMERO\n");}


{saltoLinea} {/*IGNORADO*/}
{SPACE} {/*IGNORADO*/}
. {/*IGNORADO*/}

%%

/* #######################################
   #        ESPACIO DE RUTINA            #
   ####################################### */
int main(int argc, char const *argv[])
{
	
	switch(argc){

		case 1:
			printf("Error: Faltan par%cmetros en la l%cnea de comandos.\n",160,161 );
			printf("Uso: lexico.exe archivo_entrada archivo_salida\n" );
			BREAK
		case 2:
			printf("Error: Falta par%cmetro en la l%cnea de comandos.\n",160,161 );
			printf("Uso: lexico.exe archivo_entrada archivo_salida\n" );
			BREAK
		case 3:

			yyin= fopen(argv[1],"rb");
			//no es necesario cerrar archivo abierto ya que flex lo hace

			if (yyin) // se comprueba que exista el puntero con el archivo abierto
			{
				
				FILE* salida = fopen(argv[2],"rb");
				if (salida) // se comprueba que exista el puntero con el archivo abierto de salida
				{
					printf("Error: El archivo de salida ya existe\n");
				}
				else
				{
					yyout=fopen(argv[2],"w");
					//no es necesario cerrar archivo abierto ya que flex lo hace
	    			yylex(); //lectura de tokens 
				}
			}
			else
			{
				printf("Error: El archivo de entrada no existe\n");
			}
			BREAK

		default:
			if (argc > 3 )
			{
				printf("Error: Demasiados par%cmetros en la l%cnea de comandos\n",160,161);
				printf("Uso: lexico.exe archivo_entrada archivo_salida\n");
			}
			BREAK
	}
}