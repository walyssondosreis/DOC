# **PHP & Doctrine**
<div>
<img src="https://iconape.com/wp-content/files/pm/370804/svg/doctrine-logo-icon-png-svg.png" alt="logoJS" width="50px"/> 
</div>


*Autor: Walysson dos Reis  
@walyssondosreis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
### *Conceitos e Instalação*
* Trabalhar com doctrine é trabalhar com entidades. Uma entidade é basicamente uma classe que irá 
ser mapeada para o banco de dados. Na orientação a objetos entidades são classes significativas, como 'Pessoa',
'Carro' etc. Algo que mesmo que seja alterado não é perdido sua essência.Para que esse mecanismo funcione, devemos 
instalar a biblioteca do doctrine e configurar o mecanismo de entidade ('EntityManager'). 
* Instale o Doctrine atráves do composer editando o arquivo `composer.json`:
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
~~~~
### *Criando o EntityManager*
~~~PHP
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
~~~
### *Definindo Entidade*
~~~PHP
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
### *Configurando Doctrine*
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
### *Comandos do Doctrine*
* `vendor\bin\doctrine.bat orm:info` - Busca entidades mapeadas no codigo.
* `vendor\bin\doctrine.bat orm:mapping:describe MinhaClasse` - Descreve em detalhe como será o mapeamento da classe informada.
* `vendor\bin\doctrine.bat orm:schema-tool:create` - Executa de fato a criação de tabelas no banco.

### *Persistindo dados no banco*
~~~~PHP
<?php

use Alura\Doctrine\Entity\Aluno;
use Alura\Doctrine\Helper\EntityManagerFactory;

require_once __DIR__ . '/../vendor/autoload.php';

$aluno = new Aluno();
$aluno->setNome('Vinicius Dias');

$entityManagerFactory = new EntityManagerFactory();
$entityManager = $entityManagerFactory->getEntityManager();

$entityManager->persist($aluno);

$entityManager->flush();
/* O método persiste irá apontar o objeto de aluno para gravação;
Após isso o método flush de fato irá ao banco gravar o que foi persistido.
------------------------------------------------*/
~~~~
### *Obtendo dados do banco*
~~~~PHP
<?php
use Alura\Doctrine\Entity\Aluno;
use Alura\Doctrine\Helper\EntityManagerFactory;

require_once __DIR__ . '/../vendor/autoload.php';

$entityManagerFactory = new EntityManagerFactory();
$entityManager = $entityManagerFactory->getEntityManager();

$alunoRepository = $entityManager->getRepository(Aluno::class);
/* Através do método getRepository é possivel fazer o caminho inverso que é mapear
entidades do banco para classes. É informado a classe ao qual esta entidade pertence e então
é retonado um objeto repository desta classe/tabela.*/

$alunoList = $alunoRepository->findAll();
/* O método finAll irá retornar um array apartir do repository com cada objeto mapeado. */
$nico = $alunoRepository->find(4);
/* Retorna o objeto que tem id 4 dentro desse repositorio. */

$sergioLopes = $alunoRepository->findBy([
    'nome' => 'Sergio Lopes'
]);
/* findBy irá buscar no repository os elementos que correspondam ao parâmetro
onde o campo 'nome' for igual a 'Sergio Lopes'.*/

$sergioLopes = $alunoRepository->findOneBy([
    'nome' => 'Sergio Lopes'
]);
/* Irá buscar apenas 1 elemento que corresponda aos critérios; retornando assim
o objeto e não um array como o caso acima.
------------------------------------------------*/
~~~~
### *Atualizando dados do banco*
~~~~PHP
$entityManagerFactory = new EntityManagerFactory();
$entityManager = $entityManagerFactory->getEntityManager();
$alunoRepository = $entityManager->getRepository(Aluno::class);

$id = $argv[1];
$novoNome = $argv[2];

$aluno = $alunoRepository->find($id);
$aluno->setNome($novoNome);

$entityManager->flush();

/* Método find irá buscar um elemento atraves do repositorio ; após isso definimos um 
novo nome e então gravamos no banco através do flush. Não é necessário o método persist
devido ao elemento que é fruto de busca do próprio doctrine já estar associado a ele; ou 
seja, se estive criando um objeto do tipo e quero gravar ele devo utilizar o persist para 
que este objeto seja relacionado ao doctrine antes de gravar.
------------------------------------------------*/
$aluno = $entityManager->find(Aluno::class, $id);
$aluno->setNome($novoNome);
$entityManager->flush();

/* Uma outra forma de atualizar os dados do banco é buscar diretamente através do entityManager,
fazer as alterações que quiser e já gravar com o método flush.
------------------------------------------------*/

~~~~
### *Removendo dados do banco*
~~~~PHP
$aluno = $entityManager->find(Aluno::class, $id);

$entityManager->remove($aluno);
$entityManager->flush();
/* Para remover um elemento do banco há dois caminhos ; o primeiro buscar de fato o elemento no 
banco com uma query find e logo em seguida executar a query de remoção remove e finalizar.
Ou então passar uma parte do elemento já conhecida por referência e mandar excluir poupando assim
uma query no banco. : */
$aluno = $entityManager->getReference(Aluno::class, $id);
$entityManager->remove($aluno);
$entityManager->flush();
/*------------------------------------------------*/
~~~~
### *Mapeamento OneToMany*
~~~~PHP
public function __construct()
{
    $this->telefones = new ArrayCollection();
}
public function addTelefone(Telefone $telefone)
{
    $this->telefones->add($telefone);
}
public function getTelefones(): Collection
{
    return $this->telefones;
}
public function addTelefone(Telefone $telefone)
{
    $this->telefones->add($telefone);
    return $this;
}
/* Uma ArrayCollection é uma classe do doctrine que como nome diz cria objetos
do tipo coleção de array. Com a variável do tipo de ArrayCollection podemos chamar o método add
para adicionar um item a coleção. Em um método de obter telefone caso seja tipado é interessante 
definir o tipo do retorno como a classe Collection que é a classe pai da ArrayCollection devido 
haver outros tipos desse q pode ser retornado, não necessariamente um ArrayCollection. O método 
addTelefone é um método que adiciona o telefone ao ArrayCollection e retorna o proprio objeto 
que chamou, sendo assim possível ter criar uma chamada encadeada.*/

$aluno->addTelefone(telefone)->addTelefone(telefone);
/* Passo 2 telefones de forma encadeada para cadastro.*/

/**
     * @OneToMany(targetEntity="Telefone", mappedBy="Aluno")
 */
private $telefones;
/* Mapeando a classe para entidade através das annotations, informo ao doctrine que
esse atributo é Um para Muitos e que a classe que ele pertence é a Telefone./*

/**
     * @ManyToOne(targetEntity="Aluno")
 */
    private $aluno;
/* Tenho que definir ainda na classe Telefone o atributo aluno onde informo que
é do tipo Muitos para Um e que a entidade que ele pertence é da classe Aluno.*/

public function getAluno(): Aluno
{
    return $this->aluno;
}

public function setAluno(Aluno $aluno): self
{
    $this->aluno = $aluno;
    return $this;
}
/* Na classe telefone posso criar getter e setters para este atributo que não esta sendo
utilizado para a ser útil. */ 
public function addTelefone(Telefone $telefone)
{
    $this->telefones->add($telefone);
    $telefone->setAluno($this);
    return $this;
}
/* Fazendo isso posso alterar o método addTelefone para utilizar o setter do aluno.
------------------------------------------------*/
~~~~
### *Migrations*
* `composer require doctrine/migrations` - Instale o doctrine/migrations.
~~~~PHP
// Na raiz do projeto crie o arquivo 'migrations.php' com o seguinte conteúdo.:
<?php

return [
    'name' => 'Fundamentos Doctrine',
    'migrations_namespace' => 'Alura\\Doctrine\\Migrations',
    'table_name' => 'doctrine_migration_versions',
    'column_name' => 'version',
    'column_length' => 14,
    'executed_at_column_name' => 'executed_at',
    'migrations_directory' => 'src/Migrations',
    'all_or_nothing' => true,
];
~~~~
* Após definido o migrations podemos acessar o `vendor\bin\doctrine-migrations`.
* Entre as opções do comando acima temos o `migrations:status` que lista informações das migrations.
* O comando `migrations:diff` gera os arquivos de migrations comparando o mapeamento com o banco.
* `migrations:execute --up` irá de fato executar a migration. 
* `migrations:execute --down` irá reverter o que foi feito pela migration.
* `vendor\bin\doctrine-migrations migrations:migrate` irá executar todos arquivos de migração de uma vez.
 --------
 ### *Continuando CRUD no banco de dados*
 ~~~~PHP
$entityManagerFactory = new EntityManagerFactory();
$entityManager = $entityManagerFactory->getEntityManager();

for ($i = 2; $i < $argc; $i++) {
    $numeroTelefone = $argv[$i];
    $telefone = new Telefone();
    $telefone->setNumero($numeroTelefone);

    $entityManager->persist($telefone);

    $aluno->addTelefone($telefone);

}

$entityManager->persist($aluno);
$entityManager->flush();
/* Código acima irá pegar todos os telefones passados e atribuir ao usuário no banco.
Uma outra forma a ser feito isso diretamente pelo mapeamento é utilizando 'cascade' e 'persist'.
Feito isso o '$entityManager->persist($telefone)' do codigo acima poderá ser removido: /*

/**
 * @OneToMany(targetEntity="Telefone", mappedBy="Aluno", cascade={"remove", "persist"})
 */
private $telefones;
------------------------------------------------*/
 foreach ($alunoList as $aluno) {
    $telefones = $aluno
        ->getTelefones()
        ->map(function (Telefone $telefone){
            return $telefone->getNumero();
        })
        ->toArray();

    echo "ID: {$aluno->getId()}\nNome: {$aluno->getNome()}\n\n";
    echo "Telefones: " . implode(',', $telefones);
}
/* O método 'map' do doctrine funciona assim como o 'array_map'; é recebido uma função
anônima que irá receber cada parâmetro do array passado por vez e retornar. Para alterar retorno
para array foi utilizado a função toArray.
------------------------------------------------*/
 ~~~~
 ### *Mapeamento ManyToMany*
 ~~~PHP

 /**
 * @ManyToMany(targetEntity="Aluno", inversedBy="cursos")
 */
private $alunos;
/* Defino na classe nova 'Cursos' o atributo que será relacionado com a outra Classe/Tabela.
Informo que o rótulo de entidade é Aluno. O inversedBy irá informar que esse atributo 
também é mapeado pela variável cursos da classe Aluno.*/

public function __construct()
{
   $this->alunos = new ArrayCollection();
}
/* No contrutor da classe Cursos atribua a variável $alunos a um novo objeto de ArrayCollection. */
public function __construct()
{
    $this->alunos = new ArrayCollection();
    $this->cursos = new ArrayCollection();
}
/* No construtor da classe Alunos atribua a variável $alunos e $cursos ArrayCollections. */

/**
  * @ManyToMany(targetEntity="Curso", mappedBy="alunos")
*/
private $cursos;
/* Na classe aluno também é mapeado o atribuno $cursos; nele informo o rotulo de 
entidade e que este atributo é mapeado pelo atribuno alunos da outra classe.
Com tudo isso definido na classe Aluno podemos definir agora os métodos: */

public function addCurso(Curso $curso): self
{

    if ($this->cursos->contains($curso)) {
        return $this;
    }

    $this->cursos->add($curso);
    $curso->addAluno($this);

    return $this;
}

public function getCursos(): Collection
{
    return $this->cursos;
}

/* Métodos que irão adicionar cursos ao objeto de Aluno e obter
os cursos que este objeto Aluno contém. 
------------------------------------------------*/
 ~~~
 * `vendor\bin\doctrine orm:înfo` - Execute para garantir que não há erros no mapeamento.
 * `vendor\bin\doctrine orm:mapping:describe Curso` - Detalha o mapeamento da entidade Curso.

 ### *Debug Stack*
 ~~~PHP
 $debugStack = new DebugStack();
 $entityManager->getConfiguration()->setSQLLogger($debugStack);
 /* O debugStack é uma classe para debugar o codigo. Dessa forma eu estou pegando as configurações
 e consultas que meu entityManager gera e passando para um objeto de debug. Assim quando eu ler 
 esse objeto debugStack com var_dump por exemplo eu estarei vendo quais consultas foram disparadas
 na utilização das minhas funções. */
 
 foreach ($debugStack->queries as $queryInfo) {
    echo $queryInfo['sql'] . "\n";
}
/* No foreach acima estou filtrando apenas as linhas SQL do debugStack. */
 ~~~

 ### *DQL*
 * DQL é a consulta de SQL através do doctrine com sua sintaxe voltada as Entidades.
~~~PHP
$dql = 'SELECT aluno FROM Alura\\Doctrine\Entity\Aluno aluno';
$query = $entityManager->createQuery($dql);
$alunoList = $query->getResult();
/* Codigo irá buscar da Entidade aluno todos os alunos.
------------------------------------------------*/
$dql = 'SELECT aluno FROM Alura\\Doctrine\Entity\Aluno aluno WHERE aluno.id=1';
$query = $entityManager->createQuery($dql);
$alunoList = $query->getResult();
/* Busca da Entidade Aluno os alunos cujo código ID é igual a 1. 
------------------------------------------------*/
$dql = "SELECT aluno FROM Alura\\Doctrine\Entity\Aluno aluno WHERE aluno.id=1 OR aluno.nome = 'Nico Steppat'";
$query = $entityManager->createQuery($dql);
$alunoList = $query->getResult();
/* Busca da Entidade Aluno todos os alunos cujo campo nome é 'Nico Steppat'. 
------------------------------------------------*/
~~~
 ### *Eager Joins*
 ~~~PHP
/**
 * @OneToMany(targetEntity="Telefone", mappedBy="Aluno", cascade="remove", {"persist"}, fetch="EAGER")
 */
private $telefones;
/* O fetch EAGER informa ao doctrine que aquele atributo sempre sera chamado quando o objeto ao qual 
ele esta mapeado for requisitado, ou seja, sempre que for trazer dados de um aluno eu trago junto 
também o seus telefones. Por padrão o fetch é  LAZY; que irá fazer a busca preguiçosa ou seja, somente quando 
realmente solicitado.*/

$classeAluno = Aluno::class;
$dql = "SELECT aluno, telefones, cursos FROM $classeAluno aluno JOIN aluno.telefones telefones JOIN aluno.cursos cursos";
$query = $entityManager->createQuery($dql);
/**@var Aluno[] $alunos */
$alunos = $query->getResult();
/* Utilizando o DQL eu consigo trazes todos os dados de alunos, telefone e cursos com uma só consulta 
gerado pelo doctrine, ganhando assim desempenho em vez de ter várias consultas. Os nomes na consulta 
DQL é opcionando; esta última consulta também poderia ser.: */
$dql = "SELECT a, t, c FROM $classeAluno a JOIN a.telefones t JOIN a.cursos c";
------------------------------------------------*/
~~~
 ### *Comandos simples*
 ~~~PHP
$classeAluno = Aluno::class;
$dql = "SELECT COUNT(a) FROM $classeAluno a";

$query = $entityManager->createQuery($dql);
$totalAlunos = $query->getSingleScalarResult();


echo "Total de alunos: " . $totalAlunos[0];
/* Busca a quantidade de alunos no banco sem que estes alunos sejam tragos,
a operação é feita no banco e traga. */

$classeAluno = Aluno::class;
$dql = "SELECT AVG(a.idades FROM $classeAluno a";
/* Busca média de idades do aluno. Operação é feita no banco.
------------------------------------------------*/
~~~

## Referências 

https://www.doctrine-project.org/projects/doctrine-dbal/en/2.9/reference/configuration.html  
https://www.doctrine-project.org/index.html  
https://www.doctrine-project.org/projects/doctrine-migrations/en/3.0/reference/configuration.html  


