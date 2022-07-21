# **COMPOSER**
<div>
<img src="https://seeklogo.com/images/C/composer-logo-41AA794AAD-seeklogo.com.png" alt="logoJS" width="50px"/> 
</div>


*Autor: Walysson dos Reis  
@walyssondosreis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
### *Conceitos e Instalação* 
* O composer de forma resumida é um gerenciador de dependências ou bibliotecas do PHP.
* O composer por padrão é definido por projeto ou seja, as dêpendencias ficam restritas a um projeto
, sendo possível também ter dêpendencias globais instaladas.
* O [Packagist](https://packagist.org/) é o repositório principal do composer, podendo ser adicionado outros repositórios ou até mesmo criado.
* Instalação: baixe o composer e instale em <https://getcomposer.org/>.

### *Comandos principais* 
~~~
composer --version // Verifica a versão do composer intalada.
/*------------------------------------------------*/
composer init // Inicia a criação do arquivo 'composer.json'.
/*------------------------------------------------*/
composer require guzzlehttp/guzzle // Instala pacote do guzzle no projeto.
/* Adicionando o nome do pacote necessário dentro do arquivo 'composer.json' no campo 'require'
é possivel também instalar pacotes. Após isso execute: */
composer require // Instala todas as dependências listadas no arquivo 'composer.json'.
/*------------------------------------------------*/
composer update // Atualiza as versões dos pacotes instalados.
/*------------------------------------------------*/
composer require --dev meuVendor/MeuPacote
/* Informa ao composer que aquele biblioteca será instalada apenas no ambiente de desenvolvimento.
------------------------------------------------*/
composer install --no-dev 
/* Irá instalar todos os pacotes em require do arquivo composer.json para o ambiente de produção.
------------------------------------------------*/
~~~
### *Autoload* 
~~~
...
,"autoload" : {
    "psr-4" : {
        "Alura\\BuscadorDeCursos\\": "src/"
    }
}
/* Autoload configurado no arquivo 'composer.json'. Informa padrão de autoload ao composer,
ele ira utilizar o padrão 'psr-4' onde "Alura\\BuscadorDeCursos\\" representa o vendor e 'src/'
a pasta a qual estou mapeando esse vendor. Após inserir os parâmetros de autoload execute: */

composer dump-autoload // Atualiza arquivo de autoload do composer.
------------------------------------------------*/
"autoload" : {
    "classmap": [
        "./Teste.php"
    ]
}
 
 /* Classmap é utilizado para fazer autoload em arquivos de classes que não seguem a PSR-4,
ele ira carregar todas as classes contidas no arquivo informado (Teste.php). Após autereções
no arquivo 'composer.json' execute o comando 'composer dump-autoload'.
 ------------------------------------------------*/
 "autoload" : {
    "files": ["./functions.php"]
}
/* Files informa para que ele carregue o arquivo informado 'functions.php para o autoload.
Não utilizado para classes; geralmente utilizado para arquivos de helpers'. Após autereções
no arquivo 'composer.json' execute o comando 'composer dump-autoload'.
 ------------------------------------------------*/
 ~~~
 ### *Ferramentas de Desenvolvimento*  
 
* Toda ferramenta de desenvolvimento deve ser instalada no modo `--dev` no composer.
* As ferramentas no composer ficam dentro da pasta `vendor\bin\MEUPACOTE`. 
~~~
composer require --dev phpunit/phpunit
/* PHPUnit é uma ferramenta para teste de código.
------------------------------------------------*/
composer require --dev squizlabs/php_codesniffer
/* O PHPCs é uma ferramenta para verificar padrões (PSRs) no código.*/

vendor\bin\phpcs --standard=PSR12 src\
/* Executa o PHPCs solicitando a verificação do padrão da PSR12 nos arquivos
da pasta 'src\'.
------------------------------------------------*/
composer require --dev phan/phan3
/* PHAN é uma ferramenta que busca erro de sintaxe no código PHP.
------------------------------------------------*/
 ~~~
 ### *Scripts*
 * Como o próprio nome diz serve para automatizar a execução de comandos que o composer 'gerencia'.
~~~
 "scripts": {
    "test": "phpunit tests\\TestBuscadorDeCursos",
    "cs": "phpcs --standard=PSR12 src/"
}
/* test: define que 'composer test' será utilizado para executar 'vendor\bin\phpunit tests\TestBuscadorDeCursos'.
cs : define que 'composer phpcs' será utilizado para executar 'vendor\bin\phpcs --standard=PSR12 src/'.
------------------------------------------------*/
 ~~~
 --------
## Referências 
https://getcomposer.org/  
https://packagist.org/  


 
