# **PHP & Doctrine**
<div>
<img src="https://iconape.com/wp-content/files/pm/370804/svg/doctrine-logo-icon-png-svg.png" alt="logoJS" width="50px"/> 
</div>


*Autor: Walysson dos Reis  
@walyssondosreis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
* Trabalhar com doctrine é trabalhar com entidades. Uma entidade é basicamente uma classe que irá 
ser mapeada para o banco de dados. Na orientação a objetos entidades são classes significativas como 'Pessoa',
'Carro' etc. Algo que mesmo que algo seja alterado nos seus atributos este não irá perder a sua essência.
* Para que esse mecanismo funcione vc deve instalar a biblioteca do doctrine e configurar o mecanismo 
de entidade ('EntityManager'). 
* Instale o Doctrine atráves do composer com:
~~~~
{
    "require": {
        "doctrine/orm": "^2.12",
        "doctrine/dbal": "^2.13",
        "doctrine/annotations": "^1.13",
        "symfony/yaml": "^5.4",
        "symfony/cache": "^5.4"
    },
    "autoload": {
        "psr-4": {
            "Alura\\Doctrine\\": "src/"
        }
    }
}
/*------------------------------------------------*/
~~~~

~~~~PHP
public function getEntityManager(): EntityManagerInterface{
        $rootDir = __DIR__ . '/../..';
        $config= Setup::createAnnotationMetadataConfiguration(
            [$rootDir .'/src'],
            true
        );
        $connection = [
            'driver' => 'pdo_sqlite',
            'path' => $rootDir . '/var/data/banco.sqlite'
        ];
        return EntityManager::create($connection,$config);
/* Método EntityManager é o responsável por criar a conexão do doctrine com o banco de dados,
nele é passado o caminho da pasta das nossas classes e os parâmetros de configuração de conexão com o banco
------------------------------------------------*/
/**
* @Entity
*/

/* Notação inserida antes do nome da classe que informa ao doctrine que esta classe 
é uma entidade e irá ser mapeada para o banco de dados.
------------------------------------------------*/
/**
     * @Id
     * @GeneratedValue
     * @Column(type="integer")
 */
 /* Notação colocada antes do atributo $id da classe; informa ao doctrine  que 
 este atributo é um tipo Id e tem um valor gerado automaticamente e que este valor é um inteiro.
------------------------------------------------*/
/**
     * @Column(type="string")
 */
 /* Notação colocada acima de uma variável a ser mapeada ; informa ao doctrine que
 esta variável irá ser do tipo  string.
------------------------------------------------*/
~~~~
* `vendor\bin\doctrine.bat` - Lista todos os comandos executaveis do doctrine.
~~~PHP
<?php
use Doctrine\ORM\Tools\Console\ConsoleRunner;

// replace with file to your own project bootstrap
require_once 'bootstrap.php';

// replace with mechanism to retrieve EntityManager in your app
$entityManager = GetEntityManager();

return ConsoleRunner::createHelperSet($entityManager);
/* Após rodar doctrine caso não exista o arquivo cli-config.php ou config/cli-config.php 
ele dara o codigo acima como instrução de criação deste arquivo fundamental para execução
do doctrine onde infomamos o arquvio de autoload do programa e objeto gerenciador de entidade.*/

<?php

use Alura\Doctrine\Helper\EntityManagerFactory;
use Doctrine\ORM\Tools\Console\ConsoleRunner;

require_once __DIR__ . '/vendor/autoload.php';

$entityManagerFactory = new EntityManagerFactory();
$entityManager = $entityManagerFactory->getEntityManager();

return ConsoleRunner::createHelperSet($entityManager);
/*------------------------------------------------*/
~~~
* `vendor\bin\doctrine.bat orm:info` - Busca entidades mapeadas no codigo.
* `vendor\bin\doctrine.bat orm:mapping:describe MinhaClasse` - Descreve em detalhe como será o mapeamento da classe informada.
* `vendor\bin\doctrine.bat orm:schema-tool:create` - Executa de fato a criação de tabelas no banco.

 --------
## Referências 

https://www.doctrine-project.org/projects/doctrine-dbal/en/2.9/reference/configuration.html  
https://www.doctrine-project.org/index.html  

