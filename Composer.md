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

### *Comandos* 
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
...
,"autoload" : {
    "psr-4" : {
        "Alura\\BuscadorDeCursos\\": "src/"
    }
}
/* Autoload configurado no arquivo 'composer.json'. Informa padrão de autoload ao composer,
ele ira utilizar o padrão 'psr-4' onde "Alura\\BuscadorDeCursos\\" representa o vendor e 'src/'
a pasta a qual estou mapeando esse vendor. 
------------------------------------------------*/
 ~~~
 
 --------
## Referências 
https://getcomposer.org/  
https://packagist.org/  


 
