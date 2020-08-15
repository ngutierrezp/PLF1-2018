%option noyywrap
%option yylineno
%{

/* #######################################
   #        ESPACIO DE DEFINICIONES      #
   ####################################### */
	#include <stdio.h>
	#include <stdlib.h>
	#include "sintactico.tab.h"
	
	
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


"." {return TOKEN_PUNTO;}
"," {return TOKEN_COMA;}
";" {return TOKEN_PUNTO_Y_COMA;}
"=" {return TOKEN_IGUAL;}
"+" {return TOKEN_MAS;}
"-" {return TOKEN_MENOS;}
"*" {return TOKEN_MULTIPLICADOR;}
"/" {return TOKEN_DIVISOR;}
"(" {return TOKEN_PARENT_DERECHO;}
")" {return TOKEN_PARENT_IZQUIERDO;}
"#" {return TOKEN_HASHTAG;}
"<" {return TOKEN_MENOR;}
">" {return TOKEN_MAYOR;}
":=" {return TOKEN_DEFINE;}
"if" {return TOKEN_IF;}
"do" {return TOKEN_DO;}
"<=" {return TOKEN_MAYOR_IGUAL;}
">=" {return TOKEN_MENOR_IGUAL;}
"var" {return TOKEN_VAR;}
"end" {return TOKEN_END;}
"odd" {return TOKEN_ODD;}
"call" {return TOKEN_CALL;}
"then" {return TOKEN_THEN;}
"const" {return TOKEN_CONST;}
"begin" {return TOKEN_BEGIN;}
"while" {return TOKEN_WHILE;}
"procedure" {return TOKEN_PROCEDURE;}


{IDENTIFICADOR} {return TOKEN_IDENTIFICADOR;}
{NUMERO} {return TOKEN_NUMERO;}

{saltoLinea} {/*IGNORADO*/}
{SPACE} {/*IGNORADO*/}
. {/*IGNORADO*/}

%%

/* #######################################
   #        ESPACIO DE RUTINA            #
   ####################################### */
