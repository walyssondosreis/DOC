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
~~~
 "scripts": {
    "test": "phpunit tests\\TestBuscadorDeCursos",
    "cs": "phpcs --standard=PSR12 src/"
}
/* test: define que 'composer test' será utilizado para executar 'vendor\bin\phpunit tests\TestBuscadorDeCursos'.
cs : define que 'composer phpcs' será utilizado para executar 'vendor\bin\phpcs --standard=PSR12 src/'.
------------------------------------------------*/
"scripts": {
    "test": "phpunit tests\\TestBuscadorDeCursos.php",
    "cs": "phpcs --standard=PSR12 src/",
    "phan": "phan --allow-polyfill-parser",
    "check": [
        "@phan",
        "@cs",
        "@test"
    ]
}
/* Check irá ser um script de scripts, ou seja rodando 'composer check' ele irá
executar o script de 'test', 'cs' e 'phan' respectivamente. Sem escrever o '@'
ele irá tentar executar de fato o comando 'phan','cs' etc.
------------------------------------------------*/
"scripts": {
    "ls": "dir"
}
/* Dentro dos scritps do composer consigo colocar qualquer tipo de comando suportado pelo terminal.
Este exemplo quando chamar 'composer ls' ele irá executar 'dir' que irá exibir a árvore de pastas no windows.
------------------------------------------------*/
"scripts-descriptions": {
    "check": "Roda as verificações do código. PHAN, PHPCS e PHPUNIT"
}
/* Define descrição aos scripts. Descrição é vista no comando 'composer --help'.
------------------------------------------------*/
"scripts": {
    "test": "phpunit tests\\TestBuscadorDeCursos.php",
    "post-update-cmd": [
        "@test"
    ]
},
/* O composer trabalha com eventos ; o 'post-update-cmd' e o evento que é disparado
após a excução do comando 'composer update'. Utilizado em scripts é informado ao composer
que após a execução deste evento será rodado o codigo do script de 'test'. Todos os 
eventos disponíveis pode ser verificados na documentação do composer.
------------------------------------------------*/
 ~~~
### *Publicação de pacote*
* O projeto do pacote criado geralmente é feito no GitHub; portanto crie um repositório público para seu projeto. 
* É interessante não subir para o git a pasta `vendor` do composer, para isto basta inserir no arquivo `.gitignore` do projeto.
* Veja alterações do repositório com `git status`. Adicione os arquivos alterados com `git add *`.
* Crie um commit do seu código com `git -m "Meu commit"` e informe a versão do pacote com `git tag -a v1.0.0`.
* Os padrões de versionamento do código devem atender conforme as normas do [Versionamento Semântico](https://semver.org/lang/pt-BR/).
* Criado o repositório vazio no GitHub posso linkar meu código da máquina com este repositório com `git remote add origin https:meulink`.
* Para publicar o código após isso com `git push origin master`.
* Após publicar o código podemos publicar a tag de versão com `git push origin v1.0.0`.
* No site do [Packagist]( https://packagist.org) crie uma conta ou logue com GitHub.
* Submeta o repositorio com o link; neste processo ele irá buscar informações do pacote em um arquivo 'readme.md' se tiver do projeto.
* Pacote publicado no repositório principal do composer.

### *Outras Informações*  
* No arquivo 'composer.json' podemos adicionar uma sessão `bin: ["meu-arq.php"]`; isso faria com que meu programa
fosse chamado por `php vendor\bin\meu-arq.php`.
* Para que eu possa chamar meu programa por apenas `vendor\bin\meu-arq.php` devo adicionar no início do arquivo 
'meu-arq.php', antes da abertura '<?php' o código `#!/usr/bin/env php`, assim eu informo ao sistema que aquele arquivo 
irá rodar através do interpretador 'php' do sistema.
* Podemos explicitar a lincensa do software que estou distribuindo colocando a seguinte seção no arquivo 'composer.json',
`license: "GPL-3.0"`.
 --------
## Referências 
https://getcomposer.org/  
https://packagist.org/  
https://semver.org/lang/pt-BR/  



 
