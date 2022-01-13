~~~c


PRINCIPAIS FUNÇÕES DA LINGUAGEM C - WALYSSON DOS REIS
ARQ.BIBLIOTECA	FUNÇÃO	PARÂMETRO	EXEMPLO	CONCEITO
stdio.h	fflush	stdin	fflush(stdin);	LIMPA BUFFER DO TECLADO
stdio.h	_fpurge	stdin	_fpurge(stdin);	LIMPA BUFFER DO TECLADO
locale.h	setlocale	LC_ALL,""	printf("atenção",setlocale(LC_ALL,""));	MUDA LOCALIDADE/IDIOMA PADRÃO
stdio.h	while	CONDIÇÃO - REPITA	while(1)/while(0)/while(x>10)	LAÇO DE REPETIÇÃO TESTE CONDIÇÃO INCIAL
stdio.h	do while	REPITA - CONDIÇÃO	do { x=x++} while(x!=10);	LAÇO DE REPETIÇÃO TESTE CONDIÇÃO FINAL
stdio.h	for	INICIALIZAR - CONDIÇÃO - OPERAÇÃO	for (x=0;x!=10;x=x++);	LAÇO DE REPETIÇÃO TESTE CONDIÇÃO INICIAL
stdio.h	if else	CONDIÇÃO	if (x=10) y=10+2; else y=10-2;	CONDIÇÃO DE EXECUÇÃO SE TRUE OU FALSE
stdio.h	switch case	VARIÁVEL DA CONDIÇÃO - CONDIÇÃO	switch (x) {case 1: y=4;case 2 y=5;break;}	CONDIÇÃO DE EXECUÇÃO VARIÁVEL E CASOS
stdlib.h	rand	SRAND USADO ANTES DE DECLARADO	printf("faixa 0a%d e %d",RAND_MAX,rand())	GERA NUMERO ALEATORIO
*time.h	srand	OPERAÇÃO	srand((unsigned)time(NULL));	ALIMENTA A RAND QUE GERA ALEATORIOS


##While Recebendo Getch
#include<conio.h>

while(getch()==49);

## RESUMO DE OPERADORES
/* OPERADORES ARITIMETICOS EM C
	   +           adição
	   -           subtração
	   *           multiplicação
	   /           divisão
	   =           qualifica
	   %          resto da divisão
	   
   OPERADORES DE INCREMENTO EM C
	   ++       incrementa a variável em 1, podendo ser mais. ex: conta+4
	   ~        representa o inverso binario de um valor. ex: ~valor
   
   OPERADORES ARITIMETICOS DE ATRIBUIÇÃO EM C
	   +=       aplica uma operação ao valor de uma variável. equivale à ex: variavel = variavel + 100 
	   -=       aplica uma operação ao valor de uma variável. equivale à ex: variavel = variavel -100
	   /=       aplica uma operação ao valor de uma variável. equivale à ex: variavel = variavel /100
	   
	OPERADORES ARITIMETICOS RELACIONAIS EM C
	   >        maior
	   >=       maior igual
	   <        menor
	   <=       menor igual
	   ==       igualdade *OBS: == é diferente de = , o primeire compara expreções o segundo atribui valor
	   !=       diferente
	
	OPERADORES LOGICOS EM C
	   &&       AND (e)
	   ||       OR (ou)
	   !        NOT (não)
	
	OPERADORES BIT A BIT
	   &        AND
 	   |        OR
	   ^        XOR (OR EXCLUSIVO)
	  <<       DESLOCAMENTO PARA ESQUERDA
	  >>       DESLOCAMENTO PARA DIREITA
	  
	OPERADOR CONDICIONAL DE C
	(condição) ? 'verdade' : 'falso' 
	
    OPERADOR SIZEOF
    sizeof(int)    é usado para retornar o numero de bytes usados de um tipo de variável
	   
*/

/* ###################### PRECEDENCIA DOS OPERADORES

() [] . -> 
+ -- + - * & ! ~ (tipo) sizeof
* / %
+ -
>>  <<
==  !=
&
^ 
|
&&
||
:?
=  +=  -=  *=  /=  %=  &=  ^=  |=    <<=  >>=
.
#############################################*/


------------------------------------------------
DICA SCANF LER STRINGS COM ESPAÇOS

#include <stdio.h>

int main(){
...
scanf("%[^\n]", str);
...
}

A instrução [^\n] diz ao comando scanf() para ler tudo até encontrar retorno de carro (ENTER)... no caso, representado pelo simbolo '\n'...

#### Icone em programa C

Primeiramente, você deve dizer ao Code::Blocks qual é o seu compilador de recursos no diálogo Compiler > Toolchain Executables. Se estiver utilizando mingw32, garanta que não é da pasta do Dev C++ (sério) e caso seja, baixe a última versão do compilador na internet. Como eu dizia, caso você esteja usando mingw32, o compilador de recursos se chama windres.exe.

Depois, coloque o arquivo .ico do ícone que você deseja para seu executável no mesmo diretório do seu projeto. Após isso, abra o seu projeto na IDE e adicione um arquivo à ele com nome resource.rc.

Nesse arquivo, coloque:

#define ICON_NAME 0 //Definimos o identificador para o recurso ICON_NAME
ICON_NAME ICON "icon_file.ico"

ICON_NAME é o nome do recurso; ICON especifica o tipo de recurso, que no caso é um ícone; E obviamente "icon_file.ico" é o nome do arquivo do seu ícone.

Agora, se você compilar seu programa ele já deve estar com o ícone que você escolheu.
-----------------------------


~~~
--------
## Referências
http://www.vivaolinux.com.br/dica/Lendo-strings-com-espaco-em-branco-usando-scanf/
http://www.unidev.com.br/index.php?/topic/55417-dica-mudando-o-%C3%ADcone-do-execut%C3%A1vel-no-codeblocks-para-windows/  
http://www.hardware.com.br/tutoriais/inno-setup/  

