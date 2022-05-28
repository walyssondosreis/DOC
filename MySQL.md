# **MySQL**
<div>
<img src="https://logodownload.org/wp-content/uploads/2016/10/mysql-logo-1.png" alt="logoJS" width="50px"/> 
</div>

*Autor: Walysson dos Reis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
### Tipos de dados
~~~SQL
INTEGER -- Tipo inteiro
TEXT -- Tipo texto
DATE -- Tipo data
BOOLEAN -- Tipo booleano
~~~
### Parâmetros
~~~SQL
AUTO_INCREMENT
PRIMARY KEY
NOT NULL
~~~
---------------------
### *CREATE TABLE*
~~~SQL
CREATE TABLE minhatabela(
... -- Campos da tabela.
); -- Cria tabela 'minhatabela' no banco. 
---------------------
CREATE TABLE tarefas( -- Solicita criação da tabela de nome 'tarefas'.
    id          INTEGER AUTO_INCREMENT PRIMARY KEY, -- Define coluna de inteiros de chave primária com autoincremento.
    nome        VARCHAR(20) NOT NULL, -- Define coluna de tipo caractere de tamanho max 20; Campo não pode ser nulo.
    descricao   TEXT, -- Define coluna do tipo texto.
    prazo       DATE, -- Define coluna do tipo data.
    prioridade  INTEGER(1), -- Define coluna do tipo inteiro para um caractere/digito.
    concluida   BOOLEAN -- Define coluna do tipo booleano.
); -- Finaliza bloco de parâmetros da tabela.
~~~
### *INSERT INTO*
~~~SQL
INSERT INTO minhatabela(
... -- Nome dos campos da tabela
)VALUES(
... -- Valores respectivos aos campos
);
---------------------
INSERT INTO tarefas( -- Solicita inserção na tabela 'tarefas'.
    nome, -- Campo que será definido.
    descricao, -- Campo que será definido.
    prioridade -- Campo que será definido.
)VALUES( -- Define valores que serão inseridos respectivamente.
    'tarefa01', -- Valor a ser inserido no campo 'nome'.
    'correr no parque', -- Valor a ser inserido no campo 'descricao'.
    2), -- Valor a ser inserido no campo 'prioridade'.
    ( -- Segunda linha de valores que serão inseridos.
    'tarefa02', -- Valor a ser inserido no campo 'nome'.
    'ir ao shopping', -- Valor a ser inserido no campo 'descricao'.
    2); -- Valor a ser inserido no campo 'prioridade'.

~~~
### *SELECT \* FROM*
~~~SQL
SELECT ... -- Campos que deve ser selecionados/retornados.
FROM ...  -- Tabelas as quais contem esses campos.
WHERE ... -- Condição de busca desses campos.
LIKE ... -- Comparação dos valores que estou buscando.
---------------------
SELECT * -- Retorna todos os campos
FROM tarefas  -- Da tabela 'tarefas'
---------------------
SELECT nome,descricao -- Retorna campos 'nome' e 'descricao'
FROM tarefas -- Da tabela 'tarefas'
WHERE prioridade=1; -- Onde no campo 'prioridade' esteja o valor 1
---------------------
SELECT nome,prioridade -- Retorna campos 'nome' e 'prioridade'
FROM tarefas -- Da tabela 'tarefas'
---------------------
SELECT id, nome, descricao -- Retorna campos 'id','nome','descricao'
FROM tarefas -- Da tabela 'tarefas'
WHERE descricao -- Onde no campo 'descricao'
LIKE '%golf%' -- Esteja como 'qualquer coisa + golf + qualquer coisa'
~~~~
### Definições
~~~SQL
-- (Traço duplo) Define comentário no MySQL.
---------------------
--- Alterar senha usuário root ou outro no MySQL
# mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'digitesuasenha';
FLUSH PRIVILEGES;
~~~
--------
## Referências  
https://pt.stackoverflow.com/questions/399732/phpmyadmin-problema-no-login  

