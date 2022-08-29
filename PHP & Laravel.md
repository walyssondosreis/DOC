# **LARAVEL**
<div>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Laravel.svg/985px-Laravel.svg.png" alt="logoJS" width="50px"/> 
</div>


*Autor: Walysson dos Reis  
@walyssondosreis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
### *Comandos Terminal*
~~~~
composer create-project laravel/laravel example-app
/* Cria estrutura de projeto com laravel.
------------------------------------------------*/
php artisan 
/* Ferramenta Artisan é uma das principais do Laravel; Auxilia na criação 
de código e também manipulações do servidor da aplicaão.
------------------------------------------------*/
php artisan serve
/* Inicia o servidor
------------------------------------------------*/
composer require dragon-code/laravel-app --dev
php artisan app:name meuapp 
/* Pacote necessário para alteraão do namespace de forma simplificada da aplicação.
------------------------------------------------*/
php artisan make:controller --resource 
/* Gera arquivo controller já com métodos padrões.
------------------------------------------------*/
~~~~
### *Métodos HTTP*
~~~~PHP
response($html);
/* O método response irá retornar um objeto response a página através do protocolo HTTP
------------------------------------------------*/
$request->get('id');
$request->query('id');
/* Método irá obter atráves da superglobal $_REQUEST algum dado q tenha sido passada com
nome 'id'. Com o query irá acontecer a mesma coisa porém esta informação não sera buscada
da superglobal $_REQUEST.
------------------------------------------------*/
redirect('http://globo.com');
/* Método que irá redirecionar pagina;  mesmo que enviar um response passando todos
os parâmetros de status http etc. porém esta é a função facilitadora do laravel.
------------------------------------------------*/
~~~~
--------
## Referências 
https://laravel.com/   
https://github.com/TheDragonCode/laravel-app  
 


