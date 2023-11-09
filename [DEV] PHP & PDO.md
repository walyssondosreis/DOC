# **PHP & PDO**
<div>
<img src="https://brandslogos.com/wp-content/uploads/thumbs/php-logo-vector.svg" alt="logoJS" width="50px"/> 
</div>


*Autor: Walysson dos Reis  
@walyssondosreis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------

* O PDO é uma abstração para acesso a diversos bancos de dados. Isso se dá através de um driver.
* Os drivers são habilitados através da instalação de extensões no PHP.
* Cada driver de banco tem suas caracteristicas.
~~~~PHP
$pdo = new PDO('sqlite:banco.sqlite');
/* Cria um objeto PDO com conexão a um banco de driver SQLite.
------------------------------------------------*/
$pdo->exec("Minha Consulta SQL);
/* O método exec irá realizar a consulta/execução do cod sql no banco e retornar a quantidade
de linhas com inteiro afetas pela execução.
------------------------------------------------*/
$statement =$pdo->query("Minha consulta SQL");
vardump($statment->fetchAll());
/* O método query irá retornar o resultado de alguma consulta.
fetchALL irá converter o $statement ara um único array. Por padrão o fetchALL retorna
este array com linhas duplicadas para que seus índices possam ser acessados tanto 
quanto a posição quanto pelo nome do campo na tabela. ex: $statement[0][0] retorna 'banana',
$statenebt['nomeFruta'][0] irá retornar a mesma banana.
------------------------------------------------*/
vardump($statment->fetchAll(PDO::FETCH_ASSOC));
/* Passando constante do PDO Fetch Assoc o resultado será apenas um array associativo,
diferente do método padrão.
------------------------------------------------*/
vardump($statment->fetchAll(PDO::FETCH_CLASS, MinhaCkass:: Classe));
/* A constante Class irá retornar um array onde cada resultado irá preencher um objeto de uma classe.
Necessário que os campos da tabela buscados no resultado estejam identicos aos nome de variáveis do 
objeto. Muitas vezes é melhor percorrer o FETCH_ASSOC para preencher o objeto em vez de usar desse modo.
------------------------------------------------*/
vardump($statment->fetch(PDO::FETCH_ASSOC));
/*O método fetch irá buscar apenas 1 linha; ideal para economizar memória em busca de muitos dados
ou de fato necessito apenas de um dado.
------------------------------------------------*/
vardump($statment->fetchColumn(column_number:1));
/*O método fetchColumn irá buscar todos os dados mas apenas de 1 coluna. Podendo ser informado
qual coluna a busca será feita. 
------------------------------------------------*/
$sqlInsert = "INSERT INTO students (name, birth_date) VALUES (?, ?);";
$statement = $pdo->prepare($sqlInsert);
$statement->bindValue(parameter:1, $student->name());
$statement->bindValue(parameter:2, $student->birthDate()->format(format:'Y-m-d'));
/* O prepare statement previne ataque de SqlInjection. No código sera criado uma variável
com a instrução SQL utilizando '?' no lugar dos valores. Um codigo intermediário será gerado 
para uma variável chamada $statement. Os valores então são substituídos através do método 'bindValue'
onde são passados o número da posição a ser substituida e o valor a ser inserido. 
------------------------------------------------*/
$sqlInsert = "INSERT INTO students (name, birth_date) VALUES (:name, :birth_date);";
$statement = $pdo->prepare($sqlInsert);
$statement->bindValue(parameter: ':name', $student->name());
$statement->bindValue(parameter: ':birth_date', $student->birthDate()->format(format:'Y-m-d'));
/* Os valores a serem passados na string de SQL podem ter nomes, para isto basta utilizar
o ':nomedoparametro'; e serem refenciados da mesma forma. Os dois padrões de referencia não
podem serem misturados '?' e ':' .
------------------------------------------------*/
$sqlInsert = "INSERT INTO students (name, birth_date) VALUES (:name, :birth_date);";
$statement = $pdo->prepare($sqlInsert);
$statement->bindParam(parameter: ':name', &variable: $name);
$statement->bindValue(parameter: ':birth_date', $student->birthDate()->format(format:'Y-m-d'));
/*O bindParam é bem semelhante ao bindValue com a diferença de que os valores de variáveis
são passados por referência e não por valor ,ou seja, se eu passo $valor chamo o bindParam e 
altero e variavel depois o valor a ser executado é o ultimo da alteração.
------------------------------------------------*/
$preparedStatement = $pdo->prepare(statement: 'DELETE FROM students WHERE id = ?;');
$preparedStatement->bindValue(parameter: 1, value: 4, data_type: PDO::PARAM_INT);
/* O terceiro parâmetro do método bindValue ou bindParam é o tipo da variável a ser passada;
esse tipo pode ser definido por uma constante do proprio PDO, como no exemplo define um inteiro.
------------------------------------------------*/
$preparedStatement->execute();
/* Irá executar de fato o preparedStatement no banco.
------------------------------------------------*/
$id=$pdo->lastInsertId();
/* Retorna o id do útimo registro inserido no banco.
------------------------------------------------*/
$connection->beginTransaction(); // Inicia transação.
//Minhas execusões de banco aqui ...
$connection->commit(); // Persiste transação no banco.
/* Mecanismo de transação previne erros na persistência de dados. Exemplo.: Para fechamento de 
uma turma eu preciso q todos os alunos estejam cadastrados;  então eu executaria o codigo de inserção
dos alunos e de fato gravaria isso no banco apenas no final, para isso usario o commit.
------------------------------------------------*/
$connection->rollBack();
/* Ao contrário do commit cancela a persistência dos dados no banco.
------------------------------------------------*/

$connection = new PDO(dsn: 'sqlite:' . $databasePath);
$connection->setAttribute(attribute:PDO::ATTR_ERRMODE, value:PDO::ERRMODE_EXCEPTION);
/* Configura a conexão PDO para que dipare excessões do tipo Exception.
 ------------------------------------------------*/       
~~~~
 --------
## Referências 

https://www.php.net/manual/pt_BR/book.pdo.php  
https://www.php.net/manual/en/pdostatement.fetch#refsect1-pdostatement.fetch-parameters  

