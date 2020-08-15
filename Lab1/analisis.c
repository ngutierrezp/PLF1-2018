#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define TRUE 1
#define FALSE 0

char* terminales[] = {".","const",",","=",";","var","procedure",":=","call","begin","end","if","then","while","do","+","-","*","/","(",")","odd","#","<",">","<=",">="};

char caracteres[] = {'.',',','=',';','+','-','*','/','(',')','#','<','>'};


int lengTerm = 27;
int lengchar = 13;

int termInList(char** list, char* term){

  for (int i = 0; i < lengTerm; i++)
  {
    if (strcmp(list[i], term) == 0)
    {
      return TRUE;
    }
  }
  return FALSE;
}

int charInList(char* list, char caracter){
  for (int i = 0; i < lengchar; i++)
  {
    if (list[i] == caracter)
    {
      return TRUE;
    }
  }
  return FALSE;
}

int isIdentificador(char* string){

  
  if (isalpha(string[0]))
  {
    for (int i = 0; i < strlen(string); i++)
    {
      if (!isalpha(string[i]) && !isdigit(string[i]))
      {
         return FALSE;
      }
    }
    return TRUE;
  }
  else{
    return FALSE;
  }

}
int isNumero(char* string){
  if (isdigit(string[0]))
  {
    for (int i = 0; i < strlen(string); i++)
    {
      if (!isdigit(string[i]))
      {
        return FALSE;
      }
    }
    return TRUE;
  }
  return FALSE;
}





int main(int argc, char const *argv[]) {

  if (argc < 3)
  {
    printf("Error: Faltan parámetros en la línea de comandos.\n");
    printf("Uso: lexico.exe archivo_entrada archivo_salida\n");
  }
  else if (argc > 3 )
  {
    printf("Error: Demasiados parámetros en la línea de comandos.\n");
    printf("Uso: lexico.exe archivo_entrada archivo_salida\n");
  }
  else{

    FILE* fichero = fopen(argv[1],"rb");

    if(fichero){

      FILE* escritura = fopen(argv[2],"r");
      if (escritura)
      {
        fclose(escritura);
        printf("Error: El archivo de salida ya existe.\n");

      }
      else{

    FILE* escritura = fopen(argv[2],"w");

  
  
    char string_aux[100];
    fscanf(fichero,"%s",string_aux);
    while (!feof(fichero)){

      
      printf("%s\n",string_aux);

      if (isIdentificador(string_aux)==TRUE && termInList(terminales,string_aux)==FALSE)
      {
        fprintf(escritura, "IDENTIFICADOR\n" );
      }
      else if (termInList(terminales,string_aux)==TRUE)
      {
        fprintf(escritura, "%s\n",string_aux );
      }
      else if (isNumero(string_aux)==TRUE)
      {
       fprintf(escritura, "NUMERO\n" );
      }

      else{

        for (int i = 0; i < strlen(string_aux);i++)
        {
          printf("caracter actual : %c\n",string_aux[i]);
          if (isdigit(string_aux[i]))
          {
            int j = i;
            while(isdigit(string_aux[j])){
              j++;
            }
            i=j-1;
            fprintf(escritura, "NUMERO\n" );

          }
         else if (charInList(caracteres,string_aux[i])==TRUE)
          {
            fprintf(escritura, "%c\n",string_aux[i]);
          }

          else if (string_aux[i]== 'c' && string_aux[i+1]== 'o' && string_aux[i+2]== 'o' && string_aux[i+3]== 'n'
            && string_aux[i+4]== 's' && string_aux[i+5]== 't' && !isalpha(string_aux[i+6]))
          {
            
              fprintf(escritura, "const\n" );
              i=i+5;
          }

          else if (string_aux[i]== 'v' && string_aux[i+1]== 'a' && string_aux[i+2]== 'r' 
             && !isalpha(string_aux[i+3]))
          {
            
              fprintf(escritura, "var\n" );
              i=i+2;
          }

          else if (string_aux[i]== 'p' && string_aux[i+1]== 'r' && string_aux[i+2]== 'o' && string_aux[i+3]== 'c'
            && string_aux[i+4]== 'e' && string_aux[i+5]== 'd' && string_aux[i+6]== 'u' && string_aux[i+7]== 'r' 
            && string_aux[i+8]== 'e' && !isalpha(string_aux[i+9]))
          {
            
              fprintf(escritura, "procedure\n" );
              i=i+8;
          }

          else if (string_aux[i]== 'p' && string_aux[i+1]== 'r' && string_aux[i+2]== 'o' && string_aux[i+3]== 'c'
            && string_aux[i+4]== 'e' && string_aux[i+5]== 'd' && string_aux[i+6]== 'u' && string_aux[i+7]== 'r' 
            && string_aux[i+8]== 'e' && !isalpha(string_aux[i+9]))
          {
            
              fprintf(escritura, "procedure\n" );
              i=i+8;
          }

          else if (string_aux[i]== 'c' && string_aux[i+1]== 'a' && string_aux[i+2]== 'l' && string_aux[i+3]== 'l'
             && !isalpha(string_aux[i+4]))
          {
            
              fprintf(escritura, "call\n" );
              i=i+3;
          }

          else if (string_aux[i]== 'b' && string_aux[i+1]== 'e' && string_aux[i+2]== 'g' && string_aux[i+3]== 'i'
            && string_aux[i+4]== 'n' && !isalpha(string_aux[i+5]))
          {
            
              fprintf(escritura, "begin\n" );
              i=i+4;
          }

          else if (string_aux[i]== 'e' && string_aux[i+1]== 'n' && string_aux[i+2]== 'd' 
             && !isalpha(string_aux[i+3]))
          {
            
              fprintf(escritura, "end\n" );
              i=i+2;
          }

          else if (string_aux[i]== 'o' && string_aux[i+1]== 'd' && string_aux[i+2]== 'd' 
             && !isalpha(string_aux[i+3]))
          {
            
              fprintf(escritura, "odd\n" );
              i=i+2;
          }

          else if (string_aux[i]== 'i' && string_aux[i+1]== 'f' && !isalpha(string_aux[i+2]))
          {
            
              fprintf(escritura, "if\n" );
              i=i+1;
          }

          else if (string_aux[i]== 'd' && string_aux[i+1]== 'o' && !isalpha(string_aux[i+2]))
          {
            
              fprintf(escritura, "do\n" );
              i=i+1;
          }

          else if (string_aux[i]== 't' && string_aux[i+1]== 'h' && string_aux[i+2]== 'e' && string_aux[i+3]== 'n'
             && !isalpha(string_aux[i+4]))
          {
            
              fprintf(escritura, "then\n" );
              i=i+3;
          }

          else if (string_aux[i]== 'w' && string_aux[i+1]== 'h' && string_aux[i+2]== 'i' && string_aux[i+3]== 'l'
            && string_aux[i+4]== 'e' && !isalpha(string_aux[i+5]))
          {
            
              fprintf(escritura, "while\n" );
              i=i+4;
          }

          else if (isalpha(string_aux[i]))
          {
            int j = i;
            while(isalpha(string_aux[j]) || isdigit(string_aux[j])){
              j++;
            }
            i=j-1;
            fprintf(escritura, "IDENTIFICADOR\n" );

          }
          else if (string_aux[i]== ':' && string_aux[i+1]== '=')
          {
            
              fprintf(escritura, ":=\n" );
              i++;
          }

        }
      }

  fscanf(fichero,"%s",string_aux);
  }

  fclose(fichero);
  fclose(escritura);
      }
    }
    else{
      printf("Error: El archivo de entrada no existe.\n");
    }

  }
  return 0;
}
