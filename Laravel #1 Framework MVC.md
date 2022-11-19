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
* Webpack Mix e Vite: Habilitando bootstrap e método 'asset'
* Configurações Laravel e Variáveis de ambiente (.env)
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
Route::get('/teste',function(){ echo 'Teste de rota!'; });
/* Exemplo de rota teste que envia diretamente um texto como resposta.
------------------------------------------------*/
Route::get('/series',[SeriesController::class,'index']);
/* Rota passando um controller onde é informado o nome da classe do controlador
bem como o nome da função dentro desta classe a ser chamada.
------------------------------------------------*/
~~~
### *Definindo Controllers*
* `php artisan make:controller --resource` - *Gera arquivo controller já com métodos padrões*

### *Lidando com Requests e Reponses*
* `php artisan make:request MinhaRequest` - *Criar uma arquivo de request*  
~~~PHP
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
~~~

### *Blade, Layouts e Components*
* `php artisan make:component form.input --view` - *Cria um componente dentro da pasta form sem uma classe; chamado componente anonimo*

~~~PHP
@comando_php
{{ codigo_php }}
/* O Blade é uma poderosa ferramenta do laravel. Sintaxe do blade para substituição 
de chaves php no codigo html. O arquivo deve conter a extensão '.blade.php'.
Verificar documentação para sintaxe.
------------------------------------------------*/
~~~

### *Webpack Mix e Vite: Habilitando bootstrap*
Etapa                 | Novo Projeto                  | Instanciado
------------          | :------------:                | :------------: 
Laravel Mix/Vite  | Instalar Mix/Vite   | npm run build

~~~bash
npm install laravel-mix --save-dev # Instale o Mix
webpack.mix.js # Criar arquivo na raiz do projeto
const mix = require('laravel-mix'); # Conteudo do arquivo criado.
# No arquivo package.json altera a linha para : "dev": "mix".
npm install bootstrap # Instale o bootstrap
# Na pasta resources/css renomeie o arquivo app.css para app.scss
# insira dentro do arquivo a linha : @import "~bootstrap/scss/bootstrap";
# No arquivo webpack.mix.js adicione ao final do arquivo: 
mix
    .sass('resources/css/app.scss', 'public/css');
    
npm run dev # Ira executar o laravel mix que ira por sua vez compilar o arquivo scss. Rode 2 vezes.
# Pronto Bootstrap instalado para utilizar basta na view colocar : <link rel="stylesheet" href={{ asset('css/app.css') }}>
~~~
### *Configurações Laravel e Variáveis de ambiente (.env)*
Etapa                 | Novo Projeto                  | Instanciado
------------          | :------------:                | :------------: 
.env       |  cp .env.example .env        | cp .env.example .env
~~~
falar sobre conf banco
~~~

### *Migrations*
Etapa                 | Novo Projeto                  | Instanciado
------------          | :------------:                | :------------: 
Migrations        |  php artisan migrate                    | php artisan migrate
~~~
php artisan make:migration minha_migration 
/* Cria arquivo de migration para ser persistido no banco.
------------------------------------------------*/
php artisan migrate 
/* Persiste migrations pendentes no banco.
------------------------------------------------*/
php artisan migrate:fresh
/* Remove todas as tabelas do banco criadas pelas migrates e adiciona novamente.
------------------------------------------------*/
~~~

### *DB Facade*
~~~PHP

DB::transaction(function()use($request,&$serie){  
});
/* Função transaction para persistencia de dados no banco em commit com possiibilidade de roolback.
Para mandar um rollback basta lançar um excessão. E para evitar deadlock dentro da função basta passar 
um segundo parametro para função transaction informando o max de loops.
*/

DB::beginTransaction();
DB::commit();
DB::rollback();
/* Outra abordagem para persistência de dados no banco; ideal para quando eu vá tratar os erros 
lançando excessões. Funciona assim como o PDO.
*/
~~~

### *Eloquent ORM*
falar algo

--------
## Referências 
https://laravel.com/   
https://cursos.alura.com.br/course/laravel-criando-aplicacao-mvc  
https://laravel.com/docs/9.x/blade  
https://laravel.com/docs/9.x/blade#components  
https://laravel.com/docs/9.x/eloquent#building-queries  
