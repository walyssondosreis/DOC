O composer de forma resumida é um gerenciador de dependências ou bibliotecas

baixe o composer e instale em https://getcomposer.org/

O composer por padrão é definido por projeto ou seja, as dêpendencias ficam restritas a um projeto
, sendo possivel também ter dêpendencias globais instalada.

composer init : No prompt de comandos inicia a criação do arquivo composer.json.

composer --version // Verifica a versão do composer intalada.

https://packagist.org/ repositório principal do composer, útil para realizar buscas de pacote
antes da instalação.

composer require guzzlehttp/guzzle // Instala pacote do guzzle no projeto

adicionando o nome do pacote necessario dentro do arquivo composer.json no campo require
é possivel também instalar pacotes. Após isso rode no terminal :
 
 composer require // Irá instalar todas as dependências do arquivo composer.json do projeto.
 
 composer update // Comando irá atualizar as versões dos pacotes instalados.
 
 
