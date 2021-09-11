# Speed Python
### (by Walysson dos Reis)
---------------------
### STRINGS
~~~PYTHON
stringx='Minha String' #Declara e atribui valor a uma variável chamada 'stringx'.
stringx[p1] #Solicita valor da primeira posição de 'stringx'.
stringx[p1:p2] #Solicita valor de um intervalo de 'stringx'.
stringx[p1:p2:inc] #Solicita valor de um intervalo de 'stringx' utilizando incremento de busca.
str(1994) #Retorna valor passado como string.
len(stringx) #Retorna tamanho de 'stringx'.
stringx.upper() #Retorna 'stringx' em caixa alta.
stringx.lower() #Retorna 'stringx' em caixa baixa.
stringx.isupper() #Retorna boleano; 'stringx' esta em caixa alta?
stringx.islower() #Retorna boleano; 'stringx' esta em caixa baixa?
stringx.isalpha() #Retorna boleano; stringx' contém somente letras?
stringx.strip() #Retorna 'stringx' sem espaços em branco no inicio e fim.
stringx+=str(13) #Concatena 'stringx' a string '13' e atribui valor a 'stringx'.
strx in stringx #Retorna boleano; 'strx' esta em 'stringx'?
strx.join(stringx) #Retorna 'stringx' com delimitador 'strx' em seus intervalos.
stringx.split(strx) #Retorna 'stringx' como lista tendo valores separados pelo delimitador 'strx'.
#-----------------------------------------------------------------
# Formatacao de Strings:
pi=3,1416 #Declara e atribui variável 'pi'.
print 'o valor pi %f' %pi #Retorna string referenciando variável pi.
print 'o valor pi %.2f' %pi #Retorna string referenciando variável pi.
~~~

### LISTAS
~~~PYTHON
listax=[e1,e2,e3] #Define uma lista ('listax') com 3 elementos ('e1','e2' e 'e3').
listax += [e4,e5] #Concatena elementos 'e4' e 'e5' a 'listax'.
listax[p1] #Retorna elemento armazenado na posição p1 de 'listax'.
len(listax) #Retorna tamanho (quantidade de objetos/elementos) de 'listax'.
matrizx=[l1,l2,l3] #Com listas sobre listas podemos criar uma pseudo-matriz.
matrizx[0][0] #Retorna primeiro elemento da primeira lista armazenada.
#-----------------------------------------------------------------
# Recursos para manipulação de Listas:
listax.append(var1) #Adiciona elemento 'var1' ao final de 'listax'.
listax.extend([var1,var2,var3]) #Extende 'listax' com lista de elementos '[var1,var2,var3]', (concatenação).
listax.insert(p1,var3) #Adiciona 'var3' a posição 'p1' de 'listax'.
listax.remove(var1) #Remove 'var1' de 'listax'.
listax.pop(p1) #Remove elemento de 'listax' na posição vetorial 'p1'.
listax.count(var2) #Retorna numero de elementos iguais a 'var2' em 'listax'.
listax[::-1]  #Retorna 'listax' de modo invertido (troca de posições no vetor) a sequencia de elementos da lista.
listax.reverse() #Inverte ordem dos elementos de 'listax'
~~~

### TUPLAS
~~~PYTHON
tuplax=(e1,e2,e3)  #Define uma tupla com os elementos 'e1', 'e2' e 'e3'.
~~~
* Uma dica interessante em tuplas é a possibilidade de se fazer o que chamamos em python de 'packing-unpacking', ex. 'a,b,c=1,2,3' atribui valores consecutivos as variáveis. Para inverter estes valores podendo assim fazer, ex. 'a,b,c=b,c,a' assim serão trocados os valores das variáveis entre si.

### DICIONÁRIOS
~~~PYTHON
dicx={ch1:var1,ch2:var2} #Define um dicionario (hash) de chaves 'ch1' e ch2, e valores correspondentes 'var1' e 'var2'.
dicx[ch3]=var3  #Adiciona valor 'var3' de chave 'ch3' a 'dicx'.
dicx[ch1]  #Retorna valor em 'dicx' atribuído a chave 'ch1'.
dicx.keys() #Retorna todas as chaves do dicionario.
dicx.has_key(ch) #Retorna boleano; Existe chave 'ch' em 'dicx'?
dicx.items()  #Retorna todos elementos de 'dicx' em pares 'chave':'valor'.
~~~

### FUNÇÕES
~~~PYTHON
def fun1(var1): #Define função 'fun1' que recebe argumento 'var1'.
... return var1 #Retorna 'var1'.
#-----------------------------------------------------------------
def fun1(var1,var2,var3) #Define função 'fun1' que recebe argumentos 'var1','var2' e 'var3'. Estes argumentos serão tratados como uma tupla.
... return var1,var2,var3 #Retorna 'var1','var2' e 'var3'.
#-----------------------------------------------------------------
def fun1(var1='qqcoisa'): #Define função que tem parâmetro padrão definido, ou seja, caso não seja informado este argumento sera passado o valor definido.
... return var1 #Retorna'var1'.
#-----------------------------------------------------------------
def fun1(): #Define função 'fun1' sem argumentos.
... global var1 #Declara uma variável local da função como variável global, mas somente após execução da função no programa.
... return var1 #Retorna 'var1'
#-----------------------------------------------------------------
map(fun1,listax) #Aplica recursivamente a 'fun1' cada elemento de 'listax', retornando 'N' execuções de 'fun1'.
reduce(fun1,[var1,var2]) #Passa lista de argumentos ('[var1,var2]') para 'fun1',tendo excedido os argumentos da lista são passados recursivamente para a função produto do ultimo loop de execução.
#-----------------------------------------------------------------
# List Comprehensions
[var1**2 for var1 in [1,5,8]] #Retorna lista a partir de valores aplicados a uma função simples. Como no exemplo 'var1' elevado ao quadrado para os valores [1,5,8].
[(var1,var1**2) for var in range(5)] #Retorna lista de tuplas onde são dispostos a variável(var1) e o resultado da funcao simples por tupla dentro da lista, nisso numa faixa de 0 a 4.
~~~

### LOOP FOR
~~~PYTHON
for x in listax: #Varre 'listax' de forma sequencial.
...	print(x)  #Exibe cada elemento da lista de forma sequencial.
#-----------------------------------------------------------------
for x in range(intv1,intv2,inc) #Cria uma lista  dentro de um intervalo definido com incremento também definido que ira auxiliar o 'for'.
~~~~

### TRATAMENTO DE ERROS
~~~PYTHON
while 1:
... try: int(raw_input('DIGITE NUMERO'));break
... except: print('ISSO QUE DIGITOU NAO E UM NUMERO)
~~~

### MANIPULAÇÃO DE ARQUIVOS
~~~PYTHON
var1=open('c:/pasta1','w') #Abre ou cria um arquivo para ser escrito. Os modos de abertura são os mesmo da linguagem c (r-leitura, a-escrita ao final, w-escrita).
var1.close()  #Fecha o arquivo aberto para manipulação.
var1.write('Algo') #Escreve algo no arquivo.
var1.readline()  #Faz leitura (obtenção de dados do arquivo) de uma linha por vez de execução.
var1.readlines() #Cria uma lista com cada elemento sendo uma linha string do arquivo lido.
~~~  

### ALGUNS MÓDULOS INTERESSANTES
~~~PYTHON
# Conceito de Importação de módulos
import modulox #Permite que sejam usadas as funções do 'modulox'.
modulox.funcaox(var1,var2)  #Sintaxe de chamada que permite o uso de uma função qualquer de um modulo.
from modulox import funcaox,funcaoy #Captura funções especificas de um modulo e atribui ao modulo vigente.
from modulox import *  #Agrega todas as funções do modulo especificado ao atual.
#-----------------------------------------------------------------
# Modulo Math
import math #Modulo matemático nativo de python.
import cmath #Modulo matemático para números complexos nativo de python.
math.pi #Uso da constante pi definida do modulo math.
from math import pi #Importa/agrega o valor da constante pi (presente no modulo math) ao modulo atual.
log(2)  #Exemplo de uso da função logarítmica do método math que representa o LOGATIMO NEPERIANO.
log10(2) #Exemplo de uso da função logarítmica do método math que representa um LOGATIMO BASE 10.
#-----------------------------------------------------------------
# Modulo OS
os.startfile('c:/arquivo.txt') #Apresenta o arquivo ao usuário ou executa o arquivo especificado.
os.system('ipconfig')  #Executa comandos do DOS (Windows) ou do terminal (linux) diretamente pelo interpretador.
#-----------------------------------------------------------------
# Modulo Time
time.asctime()  #Retorna Hora e data em forma de String.
time.localtime() #Retorna Hora e data em forma de Tupla .
time.time()  #Retorna Hora em ponto flutuante em segundos, muito útil para se medir tempo de execução.
time.sleep(nsec) #Pausa o tempo de execução por 'nsec' segundos.
#-----------------------------------------------------------------
# Modulo Random
random.choice(listax) #Escolhe aleatoriamente um elemento da lista.
random.random() #Gera um numero aleatório pertencente ao conjunto dos números reais (R) e entre 0 e 1.
#-----------------------------------------------------------------
# Modulo WinSound
winsound.beep(nfreq,ntempo) #Gera um beep no pc onde a frequência deve estar entre 37-32767 e a duração e dada em milissegundos, todos números inteiros.
#-----------------------------------------------------------------
# Modulo Calendar
calendar.isleap(ano) #Mais eficiente do que time para trabalhar com datas este método testa e retorna se um ano e bissexto ou não (boleano).
calendar.monthrange(ano,mes) #Retorna uma tupla informando em que dia da semana começa o mês (seg=1 ter=2 etc) e quantos dias tem o mes.
calendar.prmonth(ano,mes) #Imprime o calendário de um mês de forma organizada.
#-----------------------------------------------------------------
~~~

### NOTAÇÃO E SÍMBOLOS
* `#coding: utf-8`  // A codificação declarada no arquivo e importante para que sejam aceitos caracteres acentuados, do contrario sera apresentado erro.
* `#`   // Usado para comentar uma linha no codigo python.

* `""" bloco """ ou ''' bloco '''` // São chamadas de docString e servem para comentar em blocos no código. Sua funcionalidade se estende a isto, pois existem alguns métodos especiais que fazem dessas estruturas ferramentas para descreverem funções, métodos e classes.
* `**`  // Usado para representação de potencia (não use ^).
* `elif` // Usado para representar o 'se não se'.
* `:`  // O sinal de dois pontos aparece geralmente em blocos de 'if','for','while' e em definições de funções. Sendo breve o próximo código poderá ser colocado na frente dos dois pontos.
* `break` // Usado para interromper repetições.
* `del` // Remove referencia a um objeto.
* `exec` // Executa código passado como string.
* `assert` // Verifica se uma condição se verdadeira, se não dispara obj AssertionError.
* `;`  // Sendo muito curto o código a ser inserido , pode-se colocar o ponto e virgula antes do penúltimo comando.
* `#!/usr/bin/python`   // Adicionada ao inicio do arquivo '.py' no linux para que seja possível executar o arquivo diretamente, ou seja chama o idle automaticamente.
* `None`  // Corresponde ao NULL em outras linguagens de programação.

### MÉTODOS E FUNÇÕES
~~~PYTHON
alias=mod.func  #Permite criar um alias (apelido/atalho) para uma determinada função de um modulo.
type(var) #Metodo que permite saber qual o tipo de uma variável.
varx = input() #Permite a entrada de dados pelo usuário em uma string. Nas versões mais antigas do python usava-se raw_input().
int(var) #Método de conversão de dados para inteiros.
float(vat) #Método de conversão de dados para números de ponto flutuante.
print() #Funcao padrao para impressao/exibicao em python.
print(),  #A virgula ao final do comando print faz com que não haja salto de linha de um print para o outro.
while(1) #Ainda como na linguagem C, 'while 1' e um loop infinito, exigindo-se 'break' para interromper a execução a qualquer momento.
~~~

### CLASSES
~~~PYTHON
class NomeDaClasse:
  pass #Palavra chave que permite criar uma classe vazia
#-----------------------------------------------------------------
class NomeDaClasse:
""" Descricao da Classe NomeDaClasse em uma DocString"""
#As DocString sao muito importantes para a descrição da classe e de seus métodos para quem ira usa-la.
nome='Walysson'  #Atributo da classe.
def __init__(self,n): #Método construtor da classe.
  self.nome=n
#self referencia um atributo ou argumento da própria classe que e usado de forma recursiva e SERA SEMPRE O PRIMEIRO ARGUMENTO DA CONSTRUTORA E DEMAIS METODOS!
def metodo1(self):  #Método qualquer da classe.
""" DocString que descrevera o metodo"""
  print('Nome do Objeto: ',self.nome)			
#-----------------------------------------------------------------
# Herança Em Python
class OneClass:
  pass
class TwoClass(OneClass):
  pass
#É aceito ainda o conceito de herança múltipla, para isto basta colocar os argumentos com o nome das classes dentro dos parênteses separando-os com virgula.
#-----------------------------------------------------------------
# Métodos E Atributos Especiais De Classes
NomeDaClasse.__doc__  #Parametro que solicita a DocString da classe. Observe que a sintaxe e' Underline duplo (__).
NomeDaClasse.metodo1.__doc__ #Parâmetro que solicita a DocString do método pertencente a classe.
#-----------------------------------------------------------------
obj1.__name__  #Retorna o nome da classe que deriva determinado objeto.
#-----------------------------------------------------------------
obj1.__module__ #Atributo especial que guarda o nome do modulo o qual a classe do objeto pertence. Caso retorne '__main__'  indica que o objeto pertence a execução do modulo corrente, ou seja o modulo principal em que o programa roda.
#-----------------------------------------------------------------
NomeDaClasse.__bases__  #Verifica a qual classe esta esta' herdando.
#-----------------------------------------------------------------
def__str__(self): #METODO ESPECIAL DE CLASSE
  return 'Objeto Fiel A Classe'
#Método que define comportamento de exibição (print) para todos os objetos da classe.
#-----------------------------------------------------------------
def __call__(self,var) # METODO ESPECIAL DE CLASSE
  print('SoU Um ObJETO CaLLAbLE!')
#Metodo que permite que objetos da classe sejam callables' (chamáveis), ou seja, assim como a própria classe que o criou o objeto também poderá ser invocado tendo como comportamento agora o que o método call definir.
#-----------------------------------------------------------------
# Métodos Especiais de Classes: Operadores De Objetos}
def __add__(self, other):
""" METODO SOMA (A+B)"""
return self.valor+other.valor
def __mul__(self, other):
""" METODO MULTIPLICACAO (A*B)"""
return self.valor*other.valor
def __truediv__(self, other): #NO PYTHON 2.7 O METODO ESPECIAL SERIA __div__
"""METODO DIVISAO (A/B)"""
return self.valor/other.valor
def __pow__(self, power, modulo=None):
""" METODO POTENCIACAO (A**N)"""
return self.valor**power
#-----------------------------------------------------------------
#Apesar de nao existir sobrecarga em Python este e' um conceito de sobrecarga de operadores. Existem muitos outros operadores/símbolos possíveis de serem usados na manipulação de objetos, para isto consulte a documentação do python de acordo com sua versão em www.python.org.
~~~

### OUTROS MÉTODOS
~~~PYTHON
dir(NomeDaClasse) #Com essa função aplicada a um objeto (ou a própria classe) e' possível saber todos os atributos e métodos da classe.
#-----------------------------------------------------------------
id(objeto) # Retorna um hexadecimal que identifica um objeto ou classe, podendo assim ser usada para comparar se dois objetos (instancias de classes) são iguais.
#-----------------------------------------------------------------
help(NomeDaClasse) # Retorna toda a descrição da classe a qual pertence o objeto/instancia. Haja visto a necessidade de DocStrings bem colocadas. Ele também ira informar o modulo que a classe pertence.
#-----------------------------------------------------------------
issubclass(classefilha,classsepai) # Retorna um boleano para o teste se uma classe herda de outra.
#-----------------------------------------------------------------
callable(objeto) # Método que permite descobrir se uma funcao, classe, objeto etc e' "chamavel",por exemplo instancias de objetos geralmente não são chamáveis, já as classes e funções sim.
~~~

### CONCEITOS DIFERENCIAIS
* Python é um linguagem tipada ou seja não se deve declarar tipos as variáveis pois isto é feito internamente.

* Uma string em python é um tipo de objeto assim como em c++ mas com tratamentos vetoriais como numa sequencia de caracteres. As strings em python também não funcionam exatamente como vetores, uma grande diferença nisso é o fato de quem em string não se pode mudar posicionalmente o valor de um dado, ou seja as strings em python são objetos IMUTÁVEIS

* Listas em python são sequencias, objetos que assim como as string também possuem seus métodos e propriedades. Se diferencia das string por ser uma sequência mutável.

* Tuplas são objetos como as listas com a diferença de serem imutáveis assim como as strings.

* Dicionário em python é um objeto que manipula os dados através da busca hash, como visto na linguagem c. Dicionários são mutáveis.

* O comando 'for' em python é capaz de vasculhar/varrer qualquer sequência, seja ela strings, tuplas, listas, dicionários, etc.

* Para um resultado de uma divisão em 'float' basta que um dos operadores seja uma float. ex: 4/2 (resulta inteiro),  4./2 ou  4/2. (resulta decimal).

* Qualquer outro valor expresso por uma função além do retorno (return) é considerado efeito colateral( side effect).

* Em python um módulo é um conjunto de classes agrupadas.

* Em python pode-se criar alias ou apelidos para facilitar a utilização de métodos de outros módulos . ex:  os.startfile('c:/arquivo.txt') é mesmo que atalho=os.startfile atalho('c:/..etc).

---------
