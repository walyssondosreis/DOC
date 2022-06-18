# **PHP**
<div>
<img src="https://brandslogos.com/wp-content/uploads/thumbs/php-logo-vector.svg" alt="logoJS" width="50px"/> 
</div>


*Autor: Walysson dos Reis  
Revisão: 18/06/2022*

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
/* Retorna booleano para existência de variável.
/*----------------------------------------------*/
gettype($minhavar); 
/* Retorna qual o tipo de variável passada.
/*----------------------------------------------*/
array(); 
/* Retorna objeto array.
/*----------------------------------------------*/
array_push($meuarray,'meu valor'); 
/* Adiciona valor em array.
/*----------------------------------------------*/
array_search('valor_procurado',$meuvetor); 
/* Retorna chave correspondente do valor procurado no array.
/*----------------------------------------------*/
array_column($meuvetor,'chave_de_busca'); 
/* Retorna valores de coluna em determinado array. 
/*----------------------------------------------*/
in_array('valor_procurado',$meuarray); 
/* Retorna booleano. Verifica se valor esta presente em array.
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
strlen('minha_string'); 
/* Retorna quantidade de caracteres na string passada.
/*----------------------------------------------*/
str_replace('xv','nvw', $minhavar);
/* Substitui string dentro de outra; busca por 'xv' e escreve 'nvw' dentro da variável $minhavar.
/*----------------------------------------------*/
strtoupper('minha_string'); 
/* Retorna string em maiúsculo porém não coloca caracteres acentuados pois este exige mais de 1byte.
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
mysqli_fetch_assoc($resultado)); 
/* Percorre linhas de uma requisição sql.
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
### *Variáveis Globais*
~~~PHP
$_GET // Variável global que captura todos os dados inseridos/passados com o método 'GET' (Padrão no HTML).
$_POST // Variável global que captura todos os dados inseridos/passados com o método 'POST'.
$_SESSION // Variavel global que guarda valores $GET da sessão do usuário.
$_FILES // Variável global que guarda arquivos enviados. Criado apenas quando há submissão de arquivos na pag.
~~~

### *Error*
~~~ PHP
E_NOTICE // PHP dá um aviso mas "se vira" e continua com a execução.
E_ERROR // PHP dá erro e para a execução do programa.
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
--------
## Referências 
https://www.php.net/manual/pt_BR/  
https://www.apachefriends.org/pt_br/index.html  
https://www.php.com.br/instalacao-php-linux  
https://www.regexpal.com/  
https://regexr.com/  

