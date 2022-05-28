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
~~~
### Definições
~~~SQL
--- Alterar senha usuário root ou outro no MySQL
# mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'digitesuasenha';
FLUSH PRIVILEGES;
~~~
--------
## Referências  
https://pt.stackoverflow.com/questions/399732/phpmyadmin-problema-no-login  

