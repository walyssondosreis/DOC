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
~~~
### Métodos Úteis
~~~PHP
session_start() // Inicia/Define variável de sessão do usuário. Retorna booleano.
isset($minhaVar) // Retorna booleano para existência de variável.
array() // Retorna objeto array.
~~~
### Variáveis Globais
~~~PHP
$_GET // Variável global que captura todos os dados inseridos com 'name' no código html.
$_SESSION // Variavel que guarda sessão do usuário.
~~~
--------
## Referências 
https://www.php.net/manual/pt_BR/  
