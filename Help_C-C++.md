# **C-C++**
<div>
<img src="https://assets.website-files.com/5f91be4e005cd64f4c7b491b/61326b77c5f5266c3cee13ae_C%20C%2B%2B%20One%20Color%20Blue.png" alt="logoJS" width="50px"/> 
</div>

*Autor: Walysson dos Reis*

----------------------------------------------
*Conceitos e comandos rápidos das linguagens Javascript, HTML e CSS. Manual de consulta rápida.*  

---------------------

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

~~~c
Manipulação de arquivos em C
As operações de entrada e saída do C, incluindo as relacionadas a arquivos, encontram-se na
biblioteca stdio.h. Essa biblioteca também define várias macros, dentre elas NULL e EOF, que definem
um ponteiro nulo e o fim de arquivo, respectivamente. Além disso, é nela que está definido o tipo FILE.
Na Tabela 1 são listadas as principais funções relacionadas a manipulação de arquivos
existentes na biblioteca stdio.h.
Tabela 1: Principais funções de manipulação de arquivos da biblioteca stdio.h
Função
O que faz?
fopen() Abre um arquivo.
fclose() Fecha o arquivo garantindo a transferência do buffer.
fflush() Descarrega o buffer.
fscanf() Leitura de entrada formatada (semelhante ao scanf()).
fprintf() Escrita de saída formatada (semelhante ao printf()).
fgets() Obtém uma string do arquivo.
fgetc() Obtém um caracter do arquivo.
fputs() Insere uma string no arquivo.
fputc() Insere um caracter no arquivo.
fread() Lê um bloco de dados do arquivo.
fwrite() Escreve um bloco de dados no arquivo.
fseek() Reposiciona o ponteiro.
rewind() Reposiciona o ponteiro para o início do arquivo.
ftell() Retorna a posição do ponteiro.
Associação do arquivo
O primeiro passo para trabalhar com um arquivo é fazer a associação do arquivo físico com um
arquivo lógico. Para isso utilizamos o tipo FILE, definido na biblioteca stdio.h. A abertura/associação
do arquivo é feita pela função fopen(const char* arquivo, const char* modo), em que arquivo é o
diretório/nome do arquivo a ser aberto e modo é o modo que a associação é feita. Os tipos de
associação estão descritos na Tabela 2.
Tabela 2: Modos de abertura de arquivos
”r” Abre o arquivo somente para leitura, a partir do início. O arquivo deve existir.
”w” Cria um arquivo vazio para escrita. Se já havia o arquivo, ele é perdido.
”a” Adiciona no final do arquivo. Se o arquivo não existir, a função o cria.”r+” Abre o arquivo para leitura e escrita, a partir do início. O arquivo deve existir.
”w+” Cria um arquivo vazio para leitura e escrita. Se já havia o arquivo, ele é perdido.
”a+” Abre para adição ou leitura no final do arquivo. Se o arquivo não existir, a função o cria.
No Windows, o caracter “b” pode ser adicionado ao modo (ex: “ab”, “w+b”, etc) para
especificar que o arquivo deve ser aberto no modo binário. Em sistemas POSIX (inclusive Linux), esse
caracter é ignorado.Também é possível utilizar o caracter “t”, para abertura de no modo texto.
O código a seguir mostra um exemplo da associação.
#include <stdio.h>
main(int argc,char *argv[]) {
FILE *fp;
if ((fp=fopen (argv[1],"w"))==NULL)
printf ("Erro na abertura do arquivo.");
else
printf("Arquivo aberto com sucesso.");
fclose(fp);
}
Quando um programa encerra corretamente, com exit(0) por exemplo, os arquivos lógicos são
liberados da memória. Porém, se o programa fechar com erro, o arquivo não é liberado. Para evitar que
isso aconteça, é conveniente fechar o arquivo quando não for mais necessário o seu uso. Para isso basta
usar a função fclose(arquivo).
Manipulação do conteúdo
Para ler um caracter do arquivo, basta utilizar a função fgetc(FILE * arquivo). De forma
semelhante, para escrever um caracter no arquivo, basta utilizar a função fputc(FILE * arquivo). O
código a seguir é um exemplo de leitura, que conta o número de letras „a‟ no arquivo file.txt.
#include <stdio.h>
main(int argc,char *argv[]) {
FILE *fp;
char c;
int n = 0;
if ((fp=fopen (“file.txt”,"r")) != NULL) {
while( (c=fgetc(fp)) !=EOF) {
if (c==‟a‟ || c==‟A‟) n++;
}
fclose(fp);
printf(“Existem %d letras a no arquivo.\n”, n);
}Também é possível fazer leitura e escrita formatadas, com as funções fscanf(FILE * arquivo,
const char* formato, ...) e fprintf(FILE * arquivo, const char* formato, ...). O funcionamento dessas
funções são semelhantes às conhecidas scanf(formato, ...) e printf(formato, ...), mas direcionada para
arquivos. O próximo código é um programa que lê dez nomes do teclado e escreve no arquivo
nomes.txt.
#include <stdio.h>
main(int argc,char *argv[]) {
FILE *fp;
char nome[50];
if ((fp=fopen (“nomes.txt”,"w")) != NULL) {
for(int i=0; i<10; i++) {
printf(“Escreva um nome: ”);
gets(nome);
fprintf(fp, “Nome %d: %s\n”, i+1, nome);
}
}
fclose(fp);
}
Também é possível fazer leitura e escrita do arquivo em blocos. Para isso, devemos utilizar as
funções fread(void * buffer, size_t tamanho, size_t cont, FILE * arquivo) e fwrite(void * buffer, size_t
tamanho, size_t cont, FILE * arquivo), em que buffer contem o que se deseja escrever, tamanho indica
o tamanho em bytes de cada elemento do buffer e cont indica quantos elementos são lidos/escritos. O
código a seguir é um exemplo do uso do fwrite.
#include <stdio.h>
main(int argc,char *argv[]) {
FILE *fp;
char buffer[] = {„x‟, „y‟, „z‟};
if ((fp=fopen (“nomes.txt”,"wb")) != NULL) {
fwrite(buffer, 1, sizeof(buffer), fp);
fclose(fp);
}
O funcionamento de outras funções, assim como exemplos de código, podem ser encontrados
em http://www.cplusplus.com/reference/clibrary/cstdio/, local de referência para a montagem desse
tutorial.
~~~
--------
## Referências
http://www.vivaolinux.com.br/dica/Lendo-strings-com-espaco-em-branco-usando-scanf/
http://www.unidev.com.br/index.php?/topic/55417-dica-mudando-o-%C3%ADcone-do-execut%C3%A1vel-no-codeblocks-para-windows/  
http://www.hardware.com.br/tutoriais/inno-setup/  

