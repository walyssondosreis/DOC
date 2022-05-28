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
CREATE TABLE tarefas(
    id          INTEGER AUTO_INCREMENT PRIMARY KEY, -- Define coluna de inteiros de chave primária com autoincremento.
    nome        VARCHAR(20) NOT NULL, -- Define coluna de tipo caractere de tamanho max 20; Campo não pode ser nulo.
    descricao   TEXT, -- Define coluna do tipo texto.
    prazo       DATE, -- Define coluna do tipo data.
    prioridade  INTEGER(1), -- Define coluna do tipo inteiro para um caractere/digito.
    concluida   BOOLEAN -- Define coluna do tipo booleano.
);
~~~
### *INSERT INTO*
~~~SQL
INSERT INTO minhatabela(
... -- Nome dos campos da tabela
)VALUES(
... -- Valores respectivos aos campos
);
~~~
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

