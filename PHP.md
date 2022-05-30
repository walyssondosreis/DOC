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
include "meuarquivo.php" // Incorpora
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
echo "Meu texto"; // Retorna na página o texto informado.
echo "Meu texto" .$minhavar; // Retorna na página o texto seguido do valor a variável.
echo "Meu" .$minhavar. "texto"; // Retorna na página o texto seguido do valor da variável, seguido de outro texto. 
$_SESSION['tarefas'][]='Valor' // Insere na matriz na útima posição do vetor de nome 'tarefa' o 'Valor'.
~~~
### Métodos
~~~PHP
session_start(); // Inicia/Define variável de sessão do usuário. Retorna booleano.
isset($minhaVar); // Retorna booleano para existência de variável.
array(); // Retorna objeto array.
array_push($meuarray,'meu valor'); // Adiciona valor em array.
date('d/m/y'); // Retorna data atual conforme padrão passado como parâmetro.
count($meuvetor); // Retorna quantidade de elementos no vetor.
mysqli_connect($servidor, $usuario, $senha, $banco); // 
mysqli_connect_errno();
mysqli_query($conexao, $sqlBusca);
mysqli_fetch_assoc($resultado));
die(); 
~~~
### Variáveis Globais
~~~PHP
$_GET // Variável global que captura todos os dados inseridos com tag 'name' no código html.
$_SESSION // Variavel que guarda valores $GET da sessão do usuário.
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
--------
## Referências 
https://www.php.net/manual/pt_BR/  
https://www.apachefriends.org/pt_br/index.html  
https://www.php.com.br/instalacao-php-linux  

