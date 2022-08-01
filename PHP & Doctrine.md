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
ser mapeada para o banco de dados.
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



https://www.doctrine-project.org/projects/doctrine-dbal/en/2.9/reference/configuration.html  
https://www.doctrine-project.org/index.html  

