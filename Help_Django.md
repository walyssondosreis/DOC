# Help Django
---
### Walysson dos Reis
## `python manage.py`

* `runserver`  // Executa servidor na porta padrao 8000.
* `migrate` // Aplica migracoes padrao no banco de dados.
* `startapp meuapp` // Cria um App chamado "meuapp".
* `makemigrations meuapp` // Cria arq de migration p/ app.
* `sqlmigrate blog 0001` // Visualizar SQL a ser executado.
* `migrate blog` // Executa o SQL criado no banco.
* `createsuperuser` // Cria usuario root.
* `shell` // Abre o Shell interpretador ipython.

## `django-admin`
* `startproject meuprojeto` // Cria projeto django.

## imports
~~~python
from blog.models import Post # Importa a classe Post
from django.contrib.auth.models import User # Importa class de usuarios
~~~

## `python manage.py shell`

// Obs: Efetuar importacoes das bibliotecas necessarias.
~~~python
posts = Post.objects.all() # Atribui var todos os obj post
post = Post. objects.get(id=1) # Atribui var o post com id=1
post.author # Retorna atributo author do post
post.title="Titulo 4" # Muda o titulo to post salvando na memoria
post.save() # Metodo que persiste informacao no DB
Post.objects.create(*Inf do Obj) # Cria diretamente obj no banco.
posts.objects.filter(author__username="walysson") # Retorna post onde autor corresp
Post.objects.filter(publish__year=2021) # Obtem publicacoes do ano selecionado.
Post.objects.order_by( '-title') # Solicita queryset de objetos posts ordenados inversamente por titulo.
post.delete() # Remove obj da tabela.
user = User.objects.get(username="walysson") # Atribui var obj usuário correp
user.post_set.all() # Retorna todos post de autoria obj user
~~~

## `sudo pip install`
* `django` // Bib. padrao do django framework.
* `ipython` // Bib. interpretador ipython.
* `virtualenvwrapper` // Bib. para criacao de ambientes virtuais.

## Instalando Python
* sudo apt-get install python3
* sudo apt-get install python3-pip
* Adicione Python ao path do sistema; adicione ao final do arquivo as entradas:  
* `sudo gedit ~/.bashrc` ou `sudo gedit /etc/bash.bashrc`  
 export PYTHON_HOME  
 PATH=$PATH:$PYTHON_HOME/bin/
* Recarregue o arquivo de inicializacao.
* `source ~/.bashrc` ou `source /etc/bash.bashrc`

## Ambiente Virtual Python
* Instalado o pacote virtualenvwrapper, adicione ao final do arquivo as entradas:
* `sudo gedit ~/.bashrc` ou `sudo gedit /etc/bash.bashrc`  
export WORKON_HOME=$HOME/.virtualenvs  
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3  
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '  
export PROJECT_HOME=$HOME/Devel  
source /usr/local/bin/virtualenvwrapper.sh  
* Recarregue o arquivo de inicializacao.
* `source ~/.bashrc` ou `source /etc/bash.bashrc`
----------------------------------------------------
* mkvirtualenv meuAmbiente # Cria ambiente virtual python.
* workon # Lista ambientes virtuais disponiveis.
* workon meuAmbiente # Ativa ambiente virtual.
* deactivate # Encerra ambiente virtual.
* rmvirtualenv meuAmbiente # Exclui ambiente virtual.

## Etapas básicas de criação de projeto (\#1)
> Preparar ambiente dev  

    |-- Diretório do projeto  
	|-- Ambiente virtual  
	|-- Visual Code:  
	|--- Criar atalho execução: "Python run terminal"  
	|--- VsCode F1 -> Select Interpreter -> Selecionar python do venv.  
> Criar estrutura Django do projeto  

    |-- django-admin startproject meuProjeto

> Rodar o servidor web

    |-- python manage.py runserver
	|-- http://127.0.0.1:8000/admin/  Url para login root.
> Criar e registrar APP

    |-- startapp meuapp
	|-- Editar arquivo models.py do app criado.
	|-- Localizar nome de app no arquivo apps.py
	|-- Adicionar app a lista INSTALLED_APPS do arquivo settings.py do projeto.  
> Editar/Criar definições de DB no arquivo settings.py

    |-- Alterar arq Settings.py LANGUAGE_CODE = "pt-br"
> Editar arq View do APP anterior  

> Criar na pasta do APP arq url que mapeia a view  

> Editar arq url raiz apontando para url do APP  

## Etapas básicas de criação de projeto (\#2)
> No arq settings do projeto definir conf de db.  

> No arq settings do projeto definir linguagem e idioma.  

> Rodar comando migrate para criar tabelas que os APPS padrões usam.  

> Criar modelos de dados para meu APP.  

------------------
