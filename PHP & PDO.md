* O PDO é uma abstração para acesso a diversos bancos de dados. Isso se dá através de um driver.
* Os drivers são habilitados através da instalação de extensões no PHP
* Cada driver de banco tem suas caracteristicas
* Exemplo de conexão PHP com driver SqLite:
~~~~PHP
$pdo = new PDO('sqlite:banco.sqlite');
echo 'Conectei';
~~~~

https://www.php.net/manual/pt_BR/book.pdo.php  
