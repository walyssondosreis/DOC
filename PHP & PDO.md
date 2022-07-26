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
echo $sqlInsert; exit();
/* O prepare statement previne ataque de SqlInjection. No código sera criado uma variável
com a instrução SQL utilizando '?' no lugar dos valores. Um codigo intermediário será gerado 
para uma variável chamada $statement. Os valores então são substituídos através do método 'bindValue'
onde são passados o número da posição a ser substituida e o valor a ser inserido. 
------------------------------------------------*/

var_dump($pdo->exec($sqlInsert));

~~~~

https://www.php.net/manual/pt_BR/book.pdo.php  
https://www.php.net/manual/en/pdostatement.fetch#refsect1-pdostatement.fetch-parameters  

