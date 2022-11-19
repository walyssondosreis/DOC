# **LARAVEL : Criando uma aplicação com MVC**
<div>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Laravel.svg/985px-Laravel.svg.png" alt="logoJS" width="50px"/> 
</div>


*Autor: Walysson dos Reis  
@walyssondosreis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
* Instalando Laravel
* Definindo Rotas
* Definindo Controllers
* Lidando com Request e Response
* Blade, Layouts e Components
* Webpack Mix e Vite
* Habilitando bootstrap
* Função asset
* Configurações Laravel
* Variáveis de ambiente (.env)
* Migrations
* DB Facade
* Eloquent ORM

### *Instalando Laravel*  

Etapa         | Novo Projeto                  | Instanciado
------------  | :------------:                | :------------: 
PHP           | Instalar e configurar PHP     | - 
Composer      | Instalar Composer             | composer require --dev  
Node/NPM      | Instalar Node/NPM             | -


* `composer create-project laravel/laravel meu-app` - *Cria estrutura de projeto com laravel*
* `php artisan` - *Ferramenta Artisan é uma das principais do Laravel; Auxilia na criação de código e também manipulações do servidor da aplicação*
* `php artisan serve` - *Inicia o servidor*

### *Definindo Rotas*
~~~PHP
Route::get('/teste',function(){ echo 'Teste Otário!'; });
/* Exemplo de rota teste que envia diretamente um texto como resposta.
------------------------------------------------*/
Route::get('/series',[SeriesController::class,'index']);
/* Rota passando um controller onde é informado o nome da classe do controlador
bem como o nome da função dentro desta classe a ser chamada.
------------------------------------------------*/
~~~
### *Definindo Controllers*
* `php artisan make:controller --resource` - *Gera arquivo controller já com métodos padrões*

~~~PHP

~~~
--------
## Referências 
https://laravel.com/   
https://cursos.alura.com.br/course/laravel-criando-aplicacao-mvc  

