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
vardum($statment->fetchAll());
/* O método query irá retornar o resultado de alguma consulta.
fetchALL irá converter o $statement ara um único array. Por padrão o fetchALL retorna
este array com linhas duplicadas para que seus índices possam ser acessados tanto 
quanto a posição quanto pelo nome do campo na tabela. ex: $statement[0][0] retorna 'banana',
$statenebt['nomeFruta'][0] irá retornar a mesma banana.
------------------------------------------------*/
~~~~

https://www.php.net/manual/pt_BR/book.pdo.php  
