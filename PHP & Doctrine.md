# **PHP & Doctrine**
<div>
<img src="https://iconape.com/wp-content/files/pm/370804/svg/doctrine-logo-icon-png-svg.png" alt="logoJS" width="50px"/> 
</div>


*Autor: Walysson dos Reis  
@walyssondosreis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
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
~~~~

https://www.doctrine-project.org/projects/doctrine-dbal/en/2.9/reference/configuration.html  
