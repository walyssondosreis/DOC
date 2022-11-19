
---------------------
### *Comandos Terminal*
~~~~
composer require barryvdh/laravel-debugbar --dev

Criar middleware
php artisan make:middleware meuMideware

php artisan tinker 
/* Utilitario equivalente a 'php -a' porém que já carrega o laravel no sistema.
*/
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
~~~

### *Model*
~~~
php artisan make:model MinhaModel --migrate
/* Cria model já com arquivo de migration.
------------------------------------------------*/
~~~
--------
## Referências 
https://laravel.com/   
https://github.com/TheDragonCode/laravel-app  




