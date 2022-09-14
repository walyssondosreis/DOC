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
php artisan make:controller --resource 
/* Gera arquivo controller já com métodos padrões.
------------------------------------------------*/
~~~~

### *Routes*
~~~~PHP
Route::get('/teste',function(){ echo 'Teste Otário!'; });
/* Exemplo de rota teste que envia diretamente um texto como resposta.
------------------------------------------------*/
Route::get('/series',[SeriesController::class,'index']);
/* Rota passando um controller onde é informado o nome da classe do controlador
bem como o nome da função dentro desta classe a ser chamada.
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
### *VIEW*
~~~PHP
view('meuarqhtml',[array=>$array]);
view('meuarqhtml',compact('array'));
view('meuarqhtml')->with('series',$series);
/* A função view retorna uma view como nome diz. Recebe um arquivo html ou php
bem como um array de dados que serão utilizados naquela view onde deve conter
nome da variável e seu valor. Com a função compact obtem-se o mesmo resultado 
que anterior ; ela ira pegar uma variável e retonar um array com o nome => valor.
O método with é mais uma sintaxe que pode obter o  mesmo resultado.
------------------------------------------------*/
return view('series.index',compact('series'));
/* O padrão de nomes de views é estar com o mesmo nome da funão de controller. 
Neste caso, dentro da pasta view teriamos uma pasta 'series' e o arquivo 'index.php'
representaria a função do controller. Chamada de uma view dentro do padrão; note o ponto
representa o path da view dentro da pasta 'view.
------------------------------------------------*/
@comando_php
{{ codigo_php }}
/* O Blade é uma poderosa ferramenta do laravel. Sintaxe do blade para substituição 
de chaves php no codigo html. O arquivo deve conter a extensão '.blade.php'.
Verificar documentação para sintaxe.
------------------------------------------------*/



~~~
### *Instalando Bootstrap via WebPack : Via MIX*
~~~
npm install laravel-mix --save-dev // Instale o Mix
webpack.mix.js // Criar arquivo na raiz do projeto
const mix = require('laravel-mix'); // Conteudo do arquivo criado.
No arquivo package.json altera a linha para : "dev": "mix".
npm install bootstrap // Instale o bootstrap
Na pasta resources/css renomeie o arquivo app.css para app.scss
insira dentro do arquivo a linha : @import "~bootstrap/scss/bootstrap";
No arquivo webpack.mix.js adicione ao final do arquivo: 
mix
    .sass('resources/css/app.scss', 'public/css');
    
npm run dev // Ira executar o laravel mix que ira por sua vez compilar o arquivo scss. Rode 2 vezes.
Pronto Bootstrap instalado para utilizar basta na view colocar : <link rel="stylesheet" href={{ asset('css/app.css') }}>
------------------------------------------------*/
~~~
### *Model*
~~~
php artisan make:migration minha_migration 
/* Cria arquivo de migration para ser persistido no banco.
------------------------------------------------*/
php artisan migrate 
/* Persiste migrations pendentes no banco.
------------------------------------------------*/
php artisan make:model MinhaModel
/* Cria model.
------------------------------------------------*/
~~~
### Etapas de Projeto  

Etapa                        | Novo Projeto          | Já Instanciado
------------                 | :------------:        | :------------: 
Instalar PHP                 |  v                    | v
Instalar Composer            |  v                    | v
Instalar Node e NPM          |  v                    | v
Add Laravel Mix Projeto      |  v                    |
Add Bootstrap Projeto        |  v                    |
Criar Controller             |  v                    |
(Request e Response)         |  v                    |
Criar component com blade    |  v                    |
Criar View                   |  v                    |
Configurar Rotas             |  v                    |
Configurar DB projeto        |  v                    | v
Credenciais DB na var de amb |  v                    | v
Criar model                  |  v                    |
Configurar Migrations        |  v                    | v
Configurar CSRF              |  v                    |
Configurar Eloquent ORM      |  v                    |

--------
## Referências 
https://laravel.com/   
https://github.com/TheDragonCode/laravel-app  
https://laravel.com/docs/9.x/blade  
https://laravel.com/docs/9.x/blade#components  
https://laravel.com/docs/9.x/eloquent#building-queries  



