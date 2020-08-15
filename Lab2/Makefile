LEX=flex
CC=gcc
lexico: lex.yy.o
	$(CC) -o  lexico.exe lex.yy.o -lfl
				
lex.yy.o: lex.yy.c
	$(CC) -c lex.yy.c
lex.yy.c: lexico.l
	$(LEX) lexico.l