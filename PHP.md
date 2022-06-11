# **PHP**
<div>
<img src="https://brandslogos.com/wp-content/uploads/thumbs/php-logo-vector.svg" alt="logoJS" width="50px"/> 
</div>

*Autor: Walysson dos Reis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
### Conceitos 
~~~PHP
<?php // Inicia bloco de código PHP.
... // Meu código PHP aqui 
?> <!-- Finaliza bloco de código PHP. -->
<?= echo 'teste' ?> // Mesmo que <?php porém usado pra retornos apenas.
include "meuarquivo.php" // Incorpora arquivo externo.
' meu texto '// Com aspas simples a string não interpreta variaveis e caracter de escape '\'.
" meu texto $minhavar \n\t" //  Aspas duplas pode-se colocar variáveis e caracter de escape para interpretação direto na string.
$minhavar='teste '. $minhavar2 // Ponto (.) é utilizado para concatenar string.
PHP_EOL // Constante Php end of line q representa quebra de linha. ex: $minavar='caraca' . PHP_EOL.
|| or // Operador lógico de OU php ; pode ser representado das duas formas.
&& and // Operador lógico de E php ; pode ser representado das duas formas.
----------------------------------------------
$minhaVariavel // Cifrão ($) define variável no PHP.
----------------------------------------------
// Laços e decisões entre código HTML 
<?php foreach($meuvetor as $minhavar): ?> 
... <!-- Meu código HTML aqui -->
<?php endforeach; ?>
*Este conceito pode ser estendido também a: while/endwhile, if/endif, for/endfor.
----------------------------------------------
function nomeFuncao(){} // Define função em PHP.
foreach($meuvetor as $minhavar){}; // Laço de repetição que percorre todo vetor e atribuindo em cada ciclo à variável $minhavar.
for($i=0;$i<4;$i++){}; // Laço de repetição 'for'. Exige variável de inicialização, condição de parada e incremento.
switch($vardecontrole):{ case 1: ... break; case 2: ... break; default: ... break;} // Condicional switch case.
echo "Meu texto"; // Retorna na página o texto informado.
echo "Meu texto" . $minhavar; // Retorna na página o texto seguido do valor a variável.
echo "Meu" .$minhavar. "texto"; // Retorna na página o texto seguido do valor da variável, seguido de outro texto. 
$_SESSION['tarefas'][]='Valor' // Insere na matriz na útima posição do vetor de nome 'tarefa' o 'Valor'.
"editar.php?id=<?php echo $tarefa['id'];?>" // String que aponta para arquivo 'editar.php' e parâmetro 'id' setado com uma variável php.
echo ($minhavar == 42) ? 'sim' : 'não' // Uso do operador ternário. Verifica se '$minhavar' é igual a '42' e retorna 'sim' ou 'não'. 
~~~
### Métodos
~~~PHP
session_start(); // Inicia/Define variável de sessão do usuário. Retorna booleano.
isset($minhaVar); // Retorna booleano para existência de variável.
gettype($minhavar); // Retorna qual o tipo de variável passada.
array(); // Retorna objeto array.
array_push($meuarray,'meu valor'); // Adiciona valor em array.
array_search('valor_procurado',$meuvetor); // Retorna chave correspondente do valor procurado no array.
array_column($meuvetor,'chave_de_busca'); // Retorna valores de coluna em determinado array. 
in_array('valor_procurado',$meuarray); // Retorna booleano. Verifica se valor esta presente em array.
rtrim('minha_string','-'); //Apara string removendo caractere passado como argumento da extrema direita.
ltrim('minha_string','-'); //Apara string removendo caractere passado como argumento da extrema esquerda.
trim('minha_string','-'); //Apara string removendo caractere passado como argumento de ambos os lados.
strlen('minha_string'); // Retorna quantidade de caracteres na string passada.
nl2br('minha \n string'); // Retorna \n presente na string como <br>.
empty($meuvetor); // Retorna booleano para vetor vazio.
addslashes($minhaString);// Adiciona '\' para normalizar string que contém caracteres como apóstrofo ' ou aspas ".
stripslashes($minhaString);// Remove '\' para representar string que foi normalizada.
explode('-','minha-string') // Retorna vetor quebrando string utilizando o caractere passado ('-').
implode('-','$meuvetor') // Retorna string juntando os campos do vetor pelo separador ('-').
date('d/m/y'); // Retorna data atual conforme padrão passado como parâmetro.
checkdate($mes,$dia,$ano); // Retorna booleano. Verifica se uma data é válida.
count($meuvetor); // Retorna quantidade de elementos no vetor.
mysqli_connect($servidor, $usuario, $senha, $banco); // Efetua conexão com banco. Retorna obj. conector do banco.
mysqli_connect_errno(); // Retorna/Dispara excessão caso haja erro na conexão.
mysqli_query($conexao, $meucodSQL); // Realiza requisição com o banco. Retorna obj. de consulta.
mysqli_fetch_assoc($resultado)); // Percorre linhas de uma requisição sql.
die(); // Interrompe execusão do programa.
header('Location: meuarq.php'); // Método de cabeçalho HTTP. 'Location' irá direcionar a página para o arquivo informado.
print_r($minhavar); //Método que imprime valor da variável diretamente na página.
exit(); // Interrompe execusão do programa.
preg_match('/^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}$/','01/06/2022'); // Retorna booleano. Verifica segundo argumento confrontado com expressão regular passada.
move_uploaded_file('nome_arq',"caminhoarq/novonomearq"); // Método que move arquivo do $_FILES para determinada pasta. 
date_default_timezone_set('America/Sao_Paulo'); // Define fuso horario para função data e hora.

~~~
### Variáveis Globais
~~~PHP
$_GET // Variável global que captura todos os dados inseridos/passados com o método 'GET' (Padrão no HTML).
$_POST // Variável global que captura todos os dados inseridos/passados com o método 'POST'.
$_SESSION // Variavel global que guarda valores $GET da sessão do usuário.
$_FILES // Variável global que guarda arquivos enviados. Criado apenas quando há submissão de arquivos na pag.
~~~
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
--------
## Referências 
https://www.php.net/manual/pt_BR/  
https://www.apachefriends.org/pt_br/index.html  
https://www.php.com.br/instalacao-php-linux  
https://www.regexpal.com/  


