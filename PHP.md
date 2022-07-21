# **PHP**
<div>
<img src="https://brandslogos.com/wp-content/uploads/thumbs/php-logo-vector.svg" alt="logoJS" width="50px"/> 
</div>


*Autor: Walysson dos Reis  
@walyssondosreis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
### *Conceitos* 
~~~PHP
<?= echo 'teste' ?> 
/* Mesmo que '<?php' porém usado pra exibir valores.
------------------------------------------------*/
<?php 
/*Inicia bloco de código PHP.
------------------------------------------------*/
$minhaVariavel = 1 ;
/* Cifrão ($) define variável no PHP.
------------------------------------------------*/
define("NOME_CONST","valor_const");
/* Define constantes no PHP. Para exibição de constantes ex .: */
echo "Minha constante é : " . NOME_CONST ;
------------------------------------------------*/
include "meuarquivo.php" ;
/* Incorpora arquivo externo. É utilizado para partes não fundamentais. Programa não para caso arquivo não exista.
------------------------------------------------*/
require "meuarquivo.php" ; 
/* Incorpora arquvio externo. É utilizado para partes fundamentais. Programa para caso arquivo não exista.
------------------------------------------------*/
require_once "meuarquivo.php"; 
/* Inclui um arquivo no modo require caso este ainda não foi incluido. Evita duplicidade de inclusão.
------------------------------------------------*/
$minhavar='meu texto';
/* Com aspas simples a string não interpreta variaveis e caracter de escape '\'.
------------------------------------------------*/
$minhavar="meu texto $minhavar \n\t"; 
/*  Com aspas duplas pode-se colocar variáveis e caracter de escape para interpretação direto na string.
------------------------------------------------*/
$minhavar='teste '. $minhavar2; 
/* Ponto (.) é utilizado para concatenar string.
------------------------------------------------*/
$minhavar = 'caraca' .PHP_EOL ;
/* Constante PHP 'end of line' que insere quebra de linha.
------------------------------------------------*/
if( 1 || 2 ){}; if( 3 && 4 );
/* Operador binário de OU e E respectivamente . Tem precedência sobre operador lógico.
------------------------------------------------*/
if( 1 or 2 ){}; if( 3 and 4 );
/* Operador lógico de OU e E respectivamente .
------------------------------------------------*/
if( $minhavar === 0 ) {}; 
/* Operador idêntico. Leva em consideração o tipo da variável na comparação.
------------------------------------------------*/
for{$i=0;$i<8;$i++){ 
   if($i == 3) continue;
   if($i ==7) break;
}/* 
Laço de repetição 'for'. Exige variável de inicialização, condição de parada e incremento.
continue: Método chave da linguagem utilizado para pular/continuar/saltar no loop.
break: Método chave da linguagem utilizado para interromper/quebrar/parar no loop.
------------------------------------------------*/
foreach($meuvetor as $minhavar){}; 
/* Laço de repetição que percorre todo vetor e atribui em cada ciclo valor à variável '$minhavar'.
------------------------------------------------*/
foreach($meuvetor as $chave => $valor){}; 
/* Metodo para acessar chaves na passada do 'foreach'.
------------------------------------------------*/
switch($vardecontrole){ case 1: ... break; case 2: ... break; default: ... break;}; 
/* Condicional switch case. Exige break nos casos e dafault como caso padrão.
------------------------------------------------*/
match(); 
/* A partir do php 8; switch case melhorado;
------------------------------------------------*/
$meuarray=['chave1'=> 'meuvalor']; 
/* Define array associativo.
------------------------------------------------*/
function nomeFuncao(){}; 
/* Define função em PHP.
------------------------------------------------*/
function minhafun(array $meuvetor, float $valor): array { };
/* Declara função com tipagem de dados nos parâmetros e também no retorno.
------------------------------------------------*/
function minhafun(&$minhavar){}; 
/* Informa que função recebe passagem de var por referência(ponteiro). Utiliza-se o '&' antes da variável.
Só deve ser utilizado na definição da função. Para passar segue normal ex.: minhafun($minhavar);
------------------------------------------------*/
echo "teste $vetor['nome']"; // Isso não funciona no PHP devido a 'confusão' de aspas que o PHP faz.
echo "teste $vetor[nome]"; // Funcionará na criação da string. Excessão que foge a sintaxe padrão. 
echo "teste {$vetor['nome']}"; // Utilizando chaves. Método convencional.
/*  Métodos para interpolar array associativo dentro de string.
------------------------------------------------*/
unset($minhavar); 
/* Remove variavel da memoria; se usado com indices de lista consegue também remover valor de vetor.
------------------------------------------------*/
echo 'Meu texto'; 
/* Retorna/imprime na página o texto informado.
------------------------------------------------*/
echo 'Meu texto' . $minhavar; 
/* Retorna/imprime na página o texto seguido do valor da variável. Ponto utilizado para concatenar string.
------------------------------------------------*/
$_SESSION['tarefas'][]='Valor'; 
/* Insere na matriz na útima posição do vetor de nome 'tarefa' o 'Valor'.
------------------------------------------------*/
$meulink="editar.php?id=<?php echo $tarefa['id'];?>"; 
/* String que aponta para arquivo 'editar.php' e parâmetro 'id' setado com uma variável php.
------------------------------------------------*/
echo ($minhavar == 42) ? 'sim' : 'não'; 
/* Uso do operador ternário. Verifica se '$minhavar' é igual a '42' e retorna 'sim' ou 'não'. 
------------------------------------------------*/
list($nome1,$nome2,$nome3)=$meuvetor; 
/* Atribui as variaveis passadas por parâmetro os valores do vetor em suas respectivas posições.
------------------------------------------------*/
list('n1'=> $nome1, 'n2'=> $nome2) =$meuvetor; 
/* Atribui valores as variáveis $nome 1 e $nome2 lançando atributo a suas respectivas chaves 'n1' e 'n2'.
------------------------------------------------*/
['n1' => $nome1, 'n2'=> $nome2] = $meuvetor; 
/* Nova sintaxe apartir do PHP 7.1 faz  a mesma coisa q o list acima.
/*----------------------------------------------*/
$meuvetor=[ ...$meuvetor2, 'Texto', ...$meuvetor3];
/* Unpacking Operator: ... 
Irá desempacotar o array despejando assim os seus elementos.
Esse comportamento do operador esta associado apenas quando utilizado com arrays.
/*----------------------------------------------*/
extract($meuVetor);
/* A partir de um array passado ele cria variaveis utilizando nomes das chaves e seus valores.
/*----------------------------------------------*/
htmlspecialchars($minhaString);
/* Retorna string de forma que caracteres especiais como '< & >' não serão excutados;
Isso evita injessões de codigo em campos input, caso entrem não serão interpretados pela página.
/*----------------------------------------------*/
compact($v1,$v2,$v3);
/* Inverso do extract; recria um vetor utilizando as variáveis passadas.
/*----------------------------------------------*/
function minhaFun(int ...$alunos);
/* Spread Operator: ...
Quando este operado é utilizado em parâmetros de função significa que
a função pode ter inumeros argumentos recebidos do tipo informado. ex.: */
minhaFun(5,6,7,8);
/* e esses elemento irão compor um único elemento (array).
/*----------------------------------------------*/
function minhaFun(int $a, int $b, int $c);
/* Spred Operator: ...
Outro modo da utitilização é passar um array precedido do operador.
Ele irá passar cada elemento respectivamente como parâmetro da função.*/
minhaFun(...[5,6,8]);
/* e esses elemento irão compor um único elemento (array).
/*----------------------------------------------*/
<?php foreach($meuvetor as $minhavar): ?> 
   <!-- Meu código HTML aqui -->
<?php endforeach; ?> <?php /* 
Permite escrever código html dentro de um bloco. 
Este conceito pode ser estendido também a: while/endwhile, if/endif, for/endfor.
/*----------------------------------------------*/
?>  <!-- Finaliza bloco de código PHP. --> 
~~~
### *Orientação a Objetos*
~~~PHP
class MinhaClasse{
   public $minhavar;
   public $minhavar2;
   private $minhavar3;
}
public function __construct(string $nome,$nome2): void{
   $this->minhavar=$nome;
   public readonly string $minhavar4=$nome2;
}
public function meumetodo():void{
   $this->$minhavar3 = 'valor';
}

/* Definição de classe.
Public/Private: As variáveis e métodos assim como em outras liguagens são definidas como públicas ou privadas.
$this: Objeto da classe que se refere a própria classe, ou seja, ao valor do obj de classe que está chamando o método.
void: Informa retorno vazio; Sem retorno.
__construct: Define método construtor da classe (underline duplo + construct).
readonly: Propriedade criada a partir do PHP 8.0 que indica um atributo somente leitura; ou seja, pode ser gravada apenas uma vez.
/*----------------------------------------------*/
namespace Modelo/Automovel;
classe Carro{
   function __contruct(
      public string $nome,
      private float $valor
   ){}
}
/* 'Constructor Property Promotion'.
A partir do PHP 8 é possivel já passar argumentos para construtor já definindo como propriedades. 
namespace : Serve para organizar/empacotar logicamente as classes.
Para utilizar em os arquivos do namespace em outro arquivo .: */
use Modelo/Automovel/Carro;
use Modelo/Automóvel/{Carro, Moto, Trator}; // Sintaxe para importação de mais de uma classe de uma só vez.
/*----------------------------------------------*/
classe Aluno{
   private static $faltas=0;
   private static $escola;

   function __construct(){
      Aluno::$faltas++;
      self::$escola='Felicio';
   }
   function __destruct(){
      echo 'obj foi destruido';
   }
   function obterFaltas(){
      return self::$faltas;
   }
   
}
/* static: Define variáveis da prória classe, ou seja, não pertencentes ao objeto.
NomeDaClasse::$variavel/método  : Forma de acessar variáveis e métodos estáticos (pertencentes a classe).
self::$variável/método : De dentro da classe 'self' refere-se ao nome dela, assim como $this se refere ao objeto.
__destruct : Método especial da classe que é executado quando o objeto é destruido.
/*----------------------------------------------*/
$meuobj= new MinhaClass();
$meuobj->minhavar3 = 'um texto qualquer';
echo Aluno::obterFaltas();
/* Cria um objeto de classe. Atribui valor à variável de objeto de classe.
Acessa um método da classe Aluno (não do objeto Aluno) para objter numero de faltas.
/*----------------------------------------------*/
class Pessoa {
   protected $endereco;
   public function __construct($nome,$cpf){
   }
}

class Professor extends Pessoa {
   public function __construct($nome,$cpf){
         parent::__construct($nome,$cpf);
   }
}
/* protected : É o escopo na qual o atributo/método pode ser acessado por filhos e pai , não externamente.
extends : Indica herança.
parent:: .. : Assim como $this e self, indica classe pai, ou seja, acesso a itens da classe pai.
/*----------------------------------------------*/
spl_autoload_register(function (string $nomeCompletoDaClasse){
    $caminhoArquivo = str_replace('Alura\\Banco', 'src', $nomeCompletoDaClasse);
    $caminhoArquivo = str_replace('\\', DIRECTORY_SEPARATOR, $caminhoArquivo);
    $caminhoArquivo .= '.php';

    if(file_exists($caminhoArquivo)) {
        require_once $caminhoArquivo;
    }
});
/* O autoload é uma função padrão do PHP que busca o nome deas classes nos namespaces
assim que este não é encontrado explicitamente. Este cod irá buscas esses nomes e modificar
o path através da manipulação de string para que este seja carregado com um 'require_once'.
DIRECTORY_SEPARATOR : Constante que representa barra de separação do sistema operacional. \ (windows) ou / (linux).
/*----------------------------------------------*/
abstract class Conta {
   abstract protected minhaFun(): void;
}

class ContaPoupanca extends Conta{
   protected minhaFun(){
   }
}
/* Utilização de classe abstrata; métodos abstratos só podem ser declarados em classes abstratas.
Abstrato significa que esta classe não pode instanciar objetos. Na utilização (herança dos filhos)
o método declarado como abstrato deverá ser implementado.
/*----------------------------------------------*/
interface Autenticavel{
   public function meuMetodo(): void;
}
class Diretor extends Funcionario implements Autenticavel{
   public function meuMetodo(): void;
}
/* O PHP não permite herança múltipla; a interface é o que se assemelha a isto. Uma interface contém apenas métodos. 
Na interface todos os métodos são abstratos portanto eles devem ser implementados as classes que a chamam.
Para utilizar uma interface em um classe basta preceder o seu nome a palavra implements.
/*----------------------------------------------*/
function __toString():String; 
/* Método especial de classe para que seus objetos ao serem chamados como strings retorne algo. ex.: */
echo " Meu texto {$meuObjto} "; // Ele irá exibir a string do objeto como foi descrito no metodo _toString da classe.
/*----------------------------------------------*/
function __get(string $nomeAtributo);
/* Método especial de classe que recebe nome de atributo que a chamada ta tentando acessar. ex.: */
$meuObjt->nome; // Ele irar chamar o método __get caso o atributo $nome não seja público.
/**
 * Class Endereco
 * @package Alura\Banco\Modelo
 * @property-read string $cidade
 * @property-read string $bairro
 */
 /* Annotations serve pra informar para IDE qual atributo manipulado no __get() terá suporte a ajuda.
 @property-read informa que este atributo e somente leitura, portanto a IDE deve apresentar erro caso receba valor.
/*----------------------------------------------*/
final class ClasseAbs{
}
final protected function meuMetodo():void;
/* Final quando aplicado a classe informa que aquela classe não pode ser herdada.
Quando aplicada a um método de classe informa que aquale método não pode ser sobrescrito.
/*----------------------------------------------*/
trait Acesso {
     public function minhaFun34(): void;
}
class Minhaclasse{
   use Acesso;
   private $nome;
}
/* Traits são estruturas do PHP assim como Class e Interface porém com grande diferença.
Trais apenas copia o codigo contido nela e joga dentro da classe exatamente no lugar onde esta sendo utilizada (use).
/*----------------------------------------------*/
~~~
### *Funções*
~~~PHP
var_dump($minhavar);
/* Retorna conteúdo e tipo de variável. retorna estrutura da variável.
/*----------------------------------------------*/
session_start(); 
/* Inicia/Define variável de sessão do usuário. Retorna booleano.
/*----------------------------------------------*/
isset($minhaVar); 
/* Retorna booleano para que uma variável esteja definida, ou seja não pode estar com valor 'null'.
/*----------------------------------------------*/
gettype($minhavar); 
/* Retorna qual o tipo de variável passada.
/*----------------------------------------------*/
array(); 
/* Retorna objeto array.
/*----------------------------------------------*/
array_push($meuarray,'meu valor','meu valor2'); 
/* Adiciona valor ao array passado por referência, ou seja, o array é modificado diretamente.
/*----------------------------------------------*/
array_unshift($meuArray, 'teste','blabla');
/* Adiciona elementos ao início do array.
/*----------------------------------------------*/
array_shitf($meuArray);
/* Remove primeiro elemento do array e retorna esse elemento removido.
/*----------------------------------------------*/
array_pop($meuArray);
/* Remove último elemento do array e retorna esse elemento removido.
/*----------------------------------------------*/
array_map(function($v1){},$meuArray);
/* Retorna um array ; recebe uma função por parâmetro e aplica cada elemento 
do array recebido a esta função.
/*----------------------------------------------*/
array_reduce($meuArray, function($a,$b){},$valorInicial);
/* Retorna um valor onde são passados cada elemento do array 'meuArray' a uma 
função onde, $a = atual e $b = valor acumulado, sendo também necessario informar o valor inicial.
/*----------------------------------------------*/
array_filter($meuArray, function($item){});
/* Retorna array ; recebe função anônima que deve retornar 'true' ou 'false'
com base nisso a função sabe se o elemento passado a cada interação deve ou não entrar
na composição do novo array.
/*----------------------------------------------*/
array_search('valor_procurado',$meuvetor); 
array_search('valor_procurado',$meuvetor, true); 
/* Retorna chave correspondente ao valor procurado no array.
Mesma forma de verificação porém com valores restritos ou seja compara com o operador ===.
/*----------------------------------------------*/
array_key_exists('MinhaChave', $meuArray);
/* Retorna booleano caso chave exista no vetor, mesmo estando esta nula 'null'.
/*----------------------------------------------*/
array_column($meuvetor,'chave_de_busca'); 
/* Retorna valores de coluna em determinado array. 
/*----------------------------------------------*/
array_diff($meuarray1,$meuarray2);
/* Retorna array contendo os elementos que não são comuns a ambos os arrays.
É levado em consideração na comparação apenas os valores dos elementos, não as suas chaves.
/*----------------------------------------------*/
array_diff_key($meuarray, $meuarray2);
/* Retorna array contendo os elementos que não são comuns a ambos os arrays.
Desta vez é usado para comparação apenas as chaves dos elementos.
/*----------------------------------------------*/
array_keys($meuArray); 
/* Retorna array contendo somente as chaves de um array passado como parâmetro.
/*----------------------------------------------*/
array_values($meuArray);
/* Retorna array contendo somente os valores de um um array passado como parâmetro.
/*----------------------------------------------*/
array_combine($meuArrayChaves,$meuArrayValores);
/* Retorna array contendo valores do primeiro array como chaves e do segundo como valores.
/*----------------------------------------------*/
array_flip($meuArray);
/* Retorna array tendo invertido o que era chave pra valor e o que era valor para chave.
/*----------------------------------------------*/
array_merge($meuArray1,$meuArray2);
/* Retorna array onde o segundo array é adicionado ao final do primeiro.
Sequencia chaves numéricas; Chaves não numéricas é substuido valor pelo valor do segunto array caso ambiguo.
/*----------------------------------------------*/
in_array('valor_procurado',$meuarray); 
in_array('valor_procurado',$meuarray, true); 
/* Retorna booleano. Verifica se valor esta presente em qualquer chave do array.
Mesma forma de verificação porém com valores restritos ou seja compara com o operador ===.
/*----------------------------------------------*/
array_is_list($meuArray);
/* Verifica se um array é uma estrutura de lista, ou seja, se tem suas chaves
numéricas e sequênciais. ex. 0=>'', 1=>'' etc. Útil para verificar se um array e percorrível por foreach.
/*----------------------------------------------*/
sort($meuArray);
/* Recebe um array por referência, ou seja irá manipular diretamente o elemento  e ordena os seus elementos.
Nâo é possivel passar um array diretamente array([8,5,4]), exatamente por ele não ter retorno e sim modificar por referência.
/*----------------------------------------------*/
usort($meuArray,callback: 'minhaFunCallback'); 
/* Outro método de ordenação porém utilizado para matrizes onde deve-se passar uma função de callback onde
é necessario informar como os elementos do array serão ordenados; exemplo de função:*/
function ordenaArray($meuv1, $meuv2): int{
   if($meuv1['nota'] > $meuv2['nota']) return -1; // Elemento do primeiro vetor é maior e portanto deve vir mais a esquerda.
   if($meuv1['nota'] < $meuv2['nota']) return 1; // Elemento do primeiro vetor e menor e portanto deve vir mais a direita.
   return 0; // Elementos são iguais e portanto não deve ser alterado as suas posições.
}
function ordenaArray($meuv1, $meuv2):int{
   return $meuv1['nota'] <==> $meuv2['nota'] ; // Operador espaçonave faz algo semelhante ao que o cod acima.
}
/* Este operador irá retornar 1 caso $meuv1['nota'] seja maior que $meuv2; no usort joga $meuv1 a direita;
Irá retornar -1 caso $meuv1['nota1'] seja menor; no usort joga $meuv1 mais a esquerda ;
Irá retornar 0 caso $meuv1['nota'] seja igual a $meuv2; no usort não irá mudar posição.
/*----------------------------------------------*/
asort($meuArray);
/* Ordena o array sem perder os valores de associação 'chave'=>1
/*----------------------------------------------*/
ksort($meuArray);
/* Ordena o array pelos índices das chaves.
/*----------------------------------------------*/
rtrim('minha_string','-'); 
/* Apara string removendo caractere passado como argumento da extrema direita.
/*----------------------------------------------*/
ltrim('minha_string','-'); 
/* Apara string removendo caractere passado como argumento da extrema esquerda.
/*----------------------------------------------*/
trim('minha_string','-'); 
/* Apara string removendo caractere passado como argumento de ambos os lados.
/*----------------------------------------------*/
filter_var($meuEmail,FILTER_VALIDADE_EMAIL);
/* Retorna email passado caso válido ou bool false.
FILTER VALIDADE_EMAIL é uma constante padrão do PHP.
/*----------------------------------------------*/
strlen('minha_string'); 
/* Retorna quantidade de caracteres na string passada.
/*----------------------------------------------*/
str_replace('xv','nvw', $minhavar);
/* Substitui string dentro de outra; busca por 'xv' e escreve 'nvw' dentro da variável $minhavar.
/*----------------------------------------------*/
strtoupper('minha_string'); 
/* Retorna string em maiúsculo porém não coloca caracteres acentuados pois este exige mais de 1byte.
/*----------------------------------------------*/
strpos($minhaString, '@');
/* Retorna posição do caractere passado como argumento dentro da string passada.
/*----------------------------------------------*/
substr($mihaString,0,10);
/* Retorna uma string onde é cortado $minhaString da posição 0 a posição 10.
/*----------------------------------------------*/
strncmp($string1,$string2,$numCachar);
/* Retorna inteiro para comparação; compara string1 com string2 com o critério
do números de caracteres a serem comparados. 
/*----------------------------------------------*/
ucfirst('palavra');
/* Retorna uma string com a primeira letra da palavra em maiúsculo.
/*----------------------------------------------*/
mb_strtoupper('minha_string'); 
/* Retorna string em maúsculo, incluido caracteres acentuadose outros. Necessario instalação de extensão 'mbstring'.
/*----------------------------------------------*/
nl2br('minha \n string'); 
/* Retorna \n presente na string como <br>.
/*----------------------------------------------*/
empty($meuvetor); 
/* Retorna booleano para vetor vazio.
/*----------------------------------------------*/
addslashes($minhaString);
/* Adiciona '\' para normalizar string que contém caracteres como apóstrofo ' ou aspas ".
/*----------------------------------------------*/
stripslashes($minhaString);
/* Remove '\' para representar string que foi normalizada.
/*----------------------------------------------*/
explode('-','minha-string'); 
/* Retorna vetor quebrando string utilizando o caractere passado ('-').
/*----------------------------------------------*/
implode('-','$meuvetor'); 
/* Retorna string juntando os campos do vetor pelo separador ('-').
/*----------------------------------------------*/
date('d/m/y'); 
/* Retorna data atual conforme padrão passado como parâmetro.
/*----------------------------------------------*/
checkdate($mes,$dia,$ano); 
/* Retorna booleano. Verifica se uma data é válida.
/*----------------------------------------------*/
count($meuvetor); 
/* Retorna quantidade de elementos no vetor.
/*----------------------------------------------*/
mysqli_connect($servidor, $usuario, $senha, $banco); 
/* Efetua conexão com banco. Retorna obj. conector do banco.
/*----------------------------------------------*/
mysqli_connect_errno(); 
/* Retorna/Dispara excessão caso haja erro na conexão.
/*----------------------------------------------*/
mysqli_query($conexao, $meucodSQL); 
/* Realiza requisição com o banco. Retorna obj. de consulta.
/*----------------------------------------------*/
mysqli_fetch_assoc($resultado); 
/* Retorna apartir de um resultado de query linha por linha 
desse resultado; a cada vez que e chamada lê e define ponteiro 
para a proxima linha no resultado.
/*----------------------------------------------*/
mysqli_fetch_all($resultado);
/* Retorna todo resultado da consulta query sendo cada 
resultado uma linha da matriz. Pode ser percorrido com foreach.
/*----------------------------------------------*/
die(); 
/* Interrompe execusão do programa.
/*----------------------------------------------*/
header('Location: meuarq.php'); 
/* Método de cabeçalho HTTP. 'Location' irá direcionar a página para o arquivo informado.
/*----------------------------------------------*/
print_r($minhavar); 
/* Método que imprime valor da variável diretamente na página.
/*----------------------------------------------*/
exit(); 
/* Interrompe execusão do programa.
/*----------------------------------------------*/
preg_match('/^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}$/','01/06/2022'); 
/* Retorna booleano. Verifica segundo argumento confrontado com expressão regular passada.
/*----------------------------------------------*/
move_uploaded_file('nome_arq',"caminhoarq/novonomearq"); 
/* Método que move arquivo do $_FILES para determinada pasta. 
/*----------------------------------------------*/
date_default_timezone_set('America/Sao_Paulo'); 
/* Define fuso horario para função data e hora.
/*----------------------------------------------*/

~~~
### *Manipulação de Arquivos*
~~~PHP
$arquivo= fopen('meuArq.txt', 'r');
/* Abre arquivo como somente leitura.
/*----------------------------------------------*/
while(!feof($arquivo) $minhaVar=fgets($arquivo);
/* Enquanto não for o fim do arquivo irá capturar uma linha do arquivo.
/*----------------------------------------------*/
fclose($arquivo);
/* Fecha arquivo.
/*----------------------------------------------*/
filesize('meuArquivo.txt');
/* Retorna o tamanho de um arquivo em bytes.
/*----------------------------------------------*/
fread($arquivo, $numBytes);
/* Lê determinado número de bytes de um arquivo.
/*----------------------------------------------*/
file_get_contents('meuArquivo.txt');
/* Retorna todo arquivo lido. 
A função irá abrir o arquivo para leitura e fechar automaticamente.
/*----------------------------------------------*/
stream_filter_append('meuarquivo.txt', 'string.toupper');
/* Aplica filtro de entrada de dados padrão do PHP o qual coloca todos
os caracteres de entrada em maiúsculo. Filtros também podem ser criados.
/*----------------------------------------------*/
file_get_contents('http://swapi.co/api/films/4/');
file_get_contents('zip://arquivos.zip#lista-cursos.txt');
/* O file get também pode ser utilizado para outro tipos de entrada de dados, 
como zip:// file:// http:// entre outros. No zip consegue abrir arquivos diretamente armazenados.
/*----------------------------------------------*/
file('meuArquivo.txt');
/* Retorna cada linha do arquivo como uma elento de array.
A função irá abrir o arquivo para leitura e fechar automaticamente.
/*----------------------------------------------*/
fwrite($meuArquivo,$meuTexto, 20);
/* Escreve no arquivo somente os 20 primeiros bytes do texto passado.
/*----------------------------------------------*/
file_put_contents('meuArquivo.txt', $minhaFrase, FILE_APPEND);
/* Escreve no arquivo passado a frase passada; 
Flag informa que conteúdo deve ser adicionado ao final do arquivo.
/*----------------------------------------------*/
fgets(STDIN);
/* Captura e retorna elementos de entrada do teclado.
/*----------------------------------------------*/
stream_copy_to_stream('meuTexto.txt', STDOUT);
/* Retorna para a saída de terminal ou tela os ementos do arquivo passado.
/*----------------------------------------------*/
$contexto = stream_context_create([
   'http' => [
        'method' => 'POST',
        'header' => "X-From: PHP\r\nContent-Type: text/plain",
        'content' => 'Teste de corpo do request'
]);
file_get_contents('http://httpbin.org/post', false, $contexto);
/* O contexto para manipulação de arquivos é muito importante pois nele é possivel
definir os parêmetros para a requisição. Exemplo de contexto para uma requisição http.
O parâmetro false na função de chamada é obrigatório e indica negação para passar outro caminho localizado o contexto.
/*----------------------------------------------*/
$contexto = stream_context_create([
   'zip' => [
        'password' => '123456'
    ]
]);
file_get_contents('zip://arquivos.zip#lista-cursos.txt',false,$contexto);
/* Contexto pode ser utilizado para manipulação de outros wrappers PHP como o zip://.
Exemplo cria um contexto que contém a senha do arquivo zip permitindo assim abri-lo.
/*----------------------------------------------*/
fputcsv('meuArqCsv.csv',$meuArray,';');
/* Escreve dentro de arquivo CSV. Deve passar sempre um array e tambem um separator.
Por padrão o separador CSV é a virgula ',' porém no excel e o ponto e virgula ';'.
/*----------------------------------------------*/
$diretorioAtual= dir('.');
echo $diretorioAtual->path;
while ($arquivo = $diretorioAtual->read()) {
    echo $arquivo . PHP_EOL;
}
/* Sintaxe diferente porem irá criar um objeto do tipo diretório.
Este objeto tem metodos como 'path' que retorna o caminho atual do diretorio
e 'read' que irá retornar o nome de todos os arquivos e diretorios dentro desde diretório.
/*----------------------------------------------*/
$arquivoCursos = new SplFileObject('cursos.csv');

while (!$arquivoCursos->eof()) {
    $linha = $arquivoCursos->fgetcsv(';');
    echo $linha[0] . PHP_EOL;
}

/* O Objeto SplFileObjetct é utilizado para manipular arquivos e suas propriedades.
Método 'eof' retorna se leitura do arquivo chegou no final. 'fgetcsv' retorna cada
linha lida do arquivo csv ara a variável $linha.
/*----------------------------------------------*/
utf8_decode($curso);
/* Função que resolve problemas de codificação alterarando a tabela charset.
Irá alterar fluxo de caracteres lidos para o padrão de codificação ISO e com isso 
fazer com que o excel por exemplo consiga ler os dados com acento de um csv.
/*----------------------------------------------*/
utf8_encode($linhaArq);
/* Função retorna o inverso da anterior. Lê dados de codificação ISO e retorna UTF8.
Faz com que caractereres acentuados lidos errados pelo terminal do PHP por exemplo se 
apresentem de forma correta.
/*----------------------------------------------*/
~~~
### *Tratamento de Erros*
~~~PHP
try{
  echo "faça alguma coisa";
} catch(RunTimeException $varExcessao){
  echo "tratamento do erro";
  echo $varExcessao->getMessage(); // Obtem a mensagem de erro da variavel de excessão.
  echo $varExcessao->getLine(); // Obtem a linha a qual ocorreu o erro. 
  echo $varExcessao->getTrace(); // Obtem a pilha de excecussão ate o erro como array.
  echo $varExcessao->getTraceAsString(); // Obtem a pilha de execussão ate o erro como string.
}
/*----------------------------------------------*/
/* Bloco de tratamento de erro onde é acionado assim que houver 
na área de teste uma excessão do tipo 'RunTimeException'.
Métodos da variável de erro pertencem a classe de error padrão do php.
/*----------------------------------------------*/
try{
  echo "faça alguma coisa";
} catch(RunTimeException $varExcessao){
  echo "tratamento do erro";
} catch(MeuOutroTipoDeErro $varExcessao){
  echo "traba o segundo tipo de erro";
}
/*----------------------------------------------*/
/* Um mesmo try pode ter varios catch tratando excessões diferentes.
/*----------------------------------------------*/
try{
  echo "faça alguma coisa";
} catch(RunTimeException | MeuOutroTipoDeErro $varExcessao){
  echo "tratamento ambos tipos de erros";
}
/* Pode-se usar o operador pipe '|' para tratar mais de um tipo de erro da mesma forma.
/*----------------------------------------------*/
$minhaExcessao =  new RunTimeException(); // Cria nova instância do erro tempo de execução.
$minhaExcessao =  new RunTimeException('Minha msg de erro'); // Cria nova instância do erro tempo de execução.
throw $minhaExcessao ; // Lança um excessão que o programa trate ou exiba o erro.
/*----------------------------------------------*/
/** 
* @throws RunTimeException
*/
function minhaFuncao();
/* Notation são códigos não para o PHP e sim para outras ferramentas como as próprias
IDES. Informa a ferramenta através da notation '@throws' que a função abaixo da anotação 
irá lançar uma exceção do tipo 'RunTimeException. Muito útil para que as IDE consiga orientar
na criação de try cats.
/*----------------------------------------------*/
try{
  echo "faça alguma coisa";
} catch(Exception $varExcessao){
  echo "tratamento do erro";
}
/* O tipo Exception irá aceitar qualquer tipo que estende esta classe,
ou seja qualquer tipo de excessão será tratado.
/*----------------------------------------------*/
try{
  echo "faça alguma coisa";
} catch(Error $varExcessao){
  echo "tratamento do erro";
}
/* O tipo Error irá aceitar qualquer tipo que estende esta classe,
ou seja qualquer tipo de erro será tratado.
/*----------------------------------------------*/
try{
  echo "faça alguma coisa";
} catch(Throwable $varExcessao){
  echo "tratamento do erro";
}
/* A classe throwable é a interface genérica do PHP que extende as classes
de erro e excessão; ou seja ele irá capturar qualquer coisa, tanto erro
quanto excessão que houver.
/*----------------------------------------------*/
try{
  echo "faça alguma coisa";
} catch(Throwable $varExcessao){
  echo "tratamento do erro";
} finally{
   echo "meucod";
}
/* O finally é executado independente do try catch  ou retorno dos mesmo.
/*----------------------------------------------*/
error_reporting(E_LL);
/* Função do PHP que irá definir com a constante 'E_ALL' passada como parâmentro
para que todos os erros sejam exibidos. Pode-se alterar essa configuração também
diretamente no arquivo 'php.ini'.
/*----------------------------------------------*/
ini_set('error_reporting',E_ALL);
/* Mesmo que o codigo acima porém função pode ser utilizada para definir outros
parâmetros do arquivo 'php.ini'.
/*----------------------------------------------*/
ini_set('display_errors',0); // Desabilita a exbição de erros;
ini_set('log_errors',1); // Habilita o registro de logs.
ini_set('error_log','/var/log/minhaApp.txt'); // Define/Altera arquivo de logs.
/* Configuração geralmente utilizada no ambiente de produção onde eu quero
ocultar os meus erros porém registra-los em logs para tratamento posterior.
/*----------------------------------------------*/
~~~
### *Variáveis Globais*
~~~PHP
$_GET // Variável global que captura todos os dados inseridos/passados com o método 'GET' (Padrão no HTML).
$_POST // Variável global que captura todos os dados inseridos/passados com o método 'POST'.
$_SESSION // Variavel global que guarda valores $GET da sessão do usuário.
$_FILES // Variável global que guarda arquivos enviados. Criado apenas quando há submissão de arquivos na pag.
~~~

### *Extensões*
* Para instalar extensões abra o arquivo 'php.ini' para edição.
* Descomente a linha caso Windows: `extension_dir="D:\xampp\php\ext"`.
* Descomente também a linha referente a extensão instalada.
    * `extension=mbstring` : Extensão que trabalha com strings de forma precisa.

## Instalação e Configuração
* No Windows apenas instale o pacote [XAMPP](https://www.apachefriends.org/pt_br/index.html). Este conterá os softwares necessários:
    * Apache : Servidor Web.
    * PHP : Linguagem de programação.
    * MySQL : Banco de dados.
    * PHPmyAdmin : Interface de manipulação do MySQL.
--------
* No Linux instale os softwares:
    * Instale o PHP e o servidor Apache:
        ~~~linux
        sudo apt-get install apache2 php libapache2-mod-php
        sudo apt-get install php-soap php-xml php-curl php-opcache php-gd php-sqlite3 php-mbstring
        ~~~
    * Habilite os módulos do servidor Apache:
        ~~~linux
        a2dismod mpm_event
        a2dismod mpm_worker
        a2enmod  mpm_prefork
        a2enmod  rewrite
        a2enmod  php7.4
        ~~~
    * Altere no arquivo de configuração do PHP para o ambiente de desenvolvimento:

        * `sudo xed /etc/php/7.4/apache2/php.ini`

        ~~~linux
        error_log = /tmp/php_errors.log
        display_errors = On
        memory_limit = 256M
        max_execution_time = 120
        error_reporting = E_ALL
        file_uploads = On     
        post_max_size = 100M  
        upload_max_filesize = 100M
        session.gc_maxlifetime = 14000
        ~~~
        * `service apache2 restart`
    * Instale o MySQL: `sudo apt install mysql-server`
    * Instale o PHPMyAdmin: `sudo apt install phpmyadmin`


## Outras informações

* /var/www/html/meuprojeto... : Local padrão do projeto no Linux.
* c:\xampp\htdocs\meuprojeto... : Local padrão do projeto no Windows.
* http://localhost/meuprojeto : Endereço padrão de acesso ao projeto para ambos. 
* http://localhost/phpmyadmin : Endereço padrão de acesso ao PHP My Admin.
* CTRL + F5 : Atualiza página do navegador limpando cache da página.
* Edite o arquivo `php.ini` para ajustar hora no PHP: `data.timezone = America/Sao_Paulo`. Após reinicie o serviço do apache.
* `php -v` - No terminal verifica versão do php instalada.
* `php -a` - No terminal inicia shell interativo do php. Exige 'quit' para retornar ao terminal.
* `php -S localhost:8080` - Por padrão as novas versões do PHP ja vem com um servidor de teste, basta iniciar. Não necessita do XAMPP.  
* Para alterar a senha root do MySql através do phpMyadmin.:   
  * Abra o Xampp e clique em *Shell*. Digite o comando .: `mysqladmin -u root password`   
  * Busque no arquivo *config.inc.php* e altere a seguinte linha `$cfg['Servers'][$i]['password']=MinhaNovaSenha`.  
  * Reinicie o serviço do mysql e estará funcionando.  
--------
## Referências 
<https://www.php.net/manual/pt_BR/>  
<https://www.php-fig.org/>  
<https://phptherightway.com/>  
<http://br.phptherightway.com/>  
<https://www.apachefriends.org/pt_br/index.html>  
<https://www.php.com.br/instalacao-php-linux>  
<https://www.regexpal.com/>  
<https://regexr.com/>  
<https://www.php.net/manual/en/language.types.array.php#language.types.array.unpacking>
<https://www.php.net/manual/en/functions.arguments.php#functions.variable-arg-list>
<https://www.codigofonte.net/dicas/php/883_adicionando-mudando-a-senha-do-phpmyadmin>  
<https://kinsta.com/pt/base-de-conhecimento/senha-mysql-no-xampp/>  
<https://github.com/PHPMailer/PHPMailer>  
<https://www.php.net/manual/en/filter.filters.validate.php>  







