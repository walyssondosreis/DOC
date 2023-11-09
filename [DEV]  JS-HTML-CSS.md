# **JS-HTML-CSS**
<div>
<img src="https://cdn.iconscout.com/icon/free/png-256/javascript-23-1174949.png" alt="logoJS" width="50px"/> 
<img src="https://cdn-icons-png.flaticon.com/512/732/732212.png" alt="logoHTML" width="50px"/> 
<img src="https://cdn-icons-png.flaticon.com/512/528/528255.png" alt="logocss" width="50px" height="50px"/> 
<img src="https://cdn.iconscout.com/icon/free/png-256/jquery-7-1175152.png" alt="logoJS" width="50px"/>  
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Bootstrap_logo.svg/2560px-Bootstrap_logo.svg.png" alt="logoJS" width="50px"/>
</div>

*Autor: Walysson dos Reis*  

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*   

---------------------
<div>
<img src="https://cdn.iconscout.com/icon/free/png-256/javascript-23-1174949.png" alt="logoJS" width="50px"/>  
 ____<b>JS</b>
</div>

~~~JavaScript
// Barras duplas para comentários
/* aqui */  // Representa comentário
var x // Declara variável de forma global; podendo ser undefined
let x // Declara variável presa ao escopo do bloco; economiza memória; podendo ser undefined
const x // Declara constante global ; não podendo ser undefined
this // Referência ao próprio document
typeof(x) // Retorna tipo da variável 'x'
x>2 ? 'SIM':'NÃO' // Exemplo de uso do operador ternário
function minhaFuncao(){} // Declara função em JS
console.log('Escrevendo') // Escreve no console JS
var x={} // Declara variável de objeto em JS; equivale a Dicionário em python
window.alert('Alerta') // Cria popup com mensagem com botão 'ok' apenas.
window.prompt('Minha Msg') // Solicita ao usuário que escreva msg em popup
window.confirm('confirmaai') // Cria popup de confirmação para usuário com 'ok' e 'cancelar'
Math.round(valor) // Retorna valor arredondado
Math.random() // Método que retorna um numero aleatório entre 0 e 1
Math.PI // Constante de PI da classe Math
isNaN("qqCoisa") // Verifica se o que foi passado não é um número; Se não for retorna TRUE.
setInterval(func,30) // Define um intervalo de 30ms para a chamada da função func.
~~~
* #### CONDIÇÕES
~~~javascript
if(){} // Escopo de declaração de condicional SE em JS
switch(condição){ // Espoco de declaração da condição múltipla
  case 1: ... break // Condição 1 ; sempre interromper loop com break
  case 2: ... break //  Condição 2 ; sempre interromper loop com break
  case n: ... break // Condição n ; sempre interromper loop com break
  default: ... break }// Condição padrão caso não atenda a nenhum caso anterior
~~~
* #### LAÇOS
~~~javascript
while(){} //Escopo de declaração de laço WHILE
do{}while() // Escopo de declaração de laço DO WHILE
for(incio;teste;Incremento){} // Escoppo de declaração de laço FOR
~~~
* #### STRING
~~~javascript
" " // Aspas duplas para escrita de string
' ' // Aspas simples para escrita de string
` ` //  Crase para escrita de Template string
${ } // Simbolo de place holder utilizada dentro da template string
`o aluno ${x} é dedicado` // Passa variável x para a template string; exemplo
x.length // Retorna tamanho da String
x.toUpperCase() // Retorna String em Maiúscula
x.toLowerCase() // Retorna String em Minúscula
parseInt(x) // Converte String passada em Inteiro; pode ignorar o que vier junto com numero na string
parseFloat(x) // Converte String passada em Num. Float;  pode ignorar o que vier junto com numero na string
Number(x) // Converte String passada em Num de forma auto
String(x) // Converte Valor passado para String
String.forCharCode(elemento) // Converte elemento passado em caractere Unicode
x.toString() // Converte Valor passado para String
x.toFixed(2) // Formata um número com duas casas decimais
x.replace('.',',') // Formata um numero substituindo '.' por ',' 
x.toLocaleString('pt-BR',{style: 'currency', currency='BRL'}) //Formata valor monetário por moeda
x.charAt(0) // Retorna primeiro caractere da String
x.substring(1,3) // Retorna String delimitada pelas posições vetoriais passadas por parâmetro
x.slice(1,3) // Retorna String delimitada pelas posições vetoriais passadas por parâmetro
x.indexOf('a') // Retorna posição da primeira letra 'a' encontrada
x.lastIndexOf('a') // Retorna posição da última letra 'a' encontrada
x.indexOf('a',3) // Retorna posição da primeira letra 'a' após a 3 posição
x.split('.') // Retorna array de strings que foram separadas pelo intervalo de '.'
x.replace('a','e') // Retorna string substituido onde tiver 'a' por 'e'
x.valueOf() // Retorna valor de objeto em valor primitivo
~~~
* #### ARRAYS
~~~javascript
/* Alguns métodos de string também funcionam para vetores e vice versa */
var x=[] // Declara array
x.push() // Adiciona elemento ao array
x.pop() // Remove elemento do array
x.legth // Atributo que retorna comprimento(qtd de posições) do array 
x.sort() // Método que ordena array
~~~
* #### DOM (Document Object Model)
~~~javascript
window.document.write('minha string') // Método JS que escreve no corpo HTML; podendo ser passadas tags HTML junto.
window.document.writeln('minha string') // Método JS que escreve no corpo HTML fazendo quebra de linha.
window.document.getElementsByTagName('p') //Retorna objeto de elementos de parágrafo do documento
window.document.getElementsByTagName('p')[0].innerText //Retorna texto contido no primeiro parágrafo do documento 
window.document.getElementsByTagName('p')[0].innerHTML //Retorna cod HTML contido no primeiro parágrafo do documento 
window.document.getELementsByTagName('p')[0].style.color='red' //Altera estilo de cor do parágrafo retornado
window.document.getElementById('minha_id') // Retorna objeto de elemento com a id solicitada
window.document.getElementsByName('meu_nome') // Retorna objeto de elemento com o nome solicitado
window.document.getElementsByClassName('minha_classe') // Retorna objeto de elemento com o a classe solicitada
window.document.querySelector('h1#myid') // Retorna objeto cujo ID CSS foi passado
window.document.querySelector('h1.myclass') // Retorna objeto cujo CLASSE CSS foi passada
window.document.body // Retorna objeto de corpo (body) do documento
window.document.body.style.background = 'black' // Altera plano de fundo do documento
.addEventListener('click',funcDisparo) // Método disparo do evento clique do mouse 
.addEventListener('mouseenter',funcDisparo) // Método disparo do evento mouse entra no elemento 
.addEventListener('mouseout',funcDisparo) // Método disparo do evento mouse sai do elemento 

~~~

---------------------
<div>
<img src="https://cdn-icons-png.flaticon.com/512/732/732212.png" alt="logoHTML" width="50px"/>
____<b>HTML</b>
</div>

~~~html
<!-- Meu Comentario --> <!-- Representa comentário em HTML5 -->
<!doctype html> <!-- Tag que representa tipo do documento; colocada antes da abertura da tag <html> -->
<br> <!-- Quebra de linha -->
<hr> <!-- Desenha linha -->
<big>...</big> <!-- Auta tamanho de texto -->
<html>...</html> <!-- Tag de abertura de documento HTML -->
<html lang="pt-br">...</html> <!-- Atributo que define idioma da página -->
<head>...</head> <!-- Tag colocada em <html> que representa as declarações da pag. -->
<meta charset="UTF-8"> <!-- Tag coloca em <head> para metadados; atributo habilita a codificação da página -->
<title>...</title> <!-- Tag colocada em <head> que representa o título da pag html -->
<style>...</style> <!-- Tag colocada em <head> para abertura de cod. CSS. -->
<body>...</body> <!-- Tag colocada em <html> que representa o corpo do documento ;  onde fica basicamente todo conteúdo da pag. -->
<body onload='minhafuncao()' ... <!-- Evento de carregamento da página -->
<link rel="stylesheet" href="style.css"> <!-- Tag colocada em <head> para ligar arquivo HTML ao arq CSS externo -->
<script>...</script> <!-- Tag para inserção de cod javascript -->
<script src="script.js"></script> <!-- Tag que representa a ligação do HTML com um arquivo externo JS -->
<h1>...</h1> <!-- Tag para escrita de título -->
<p>...</p> <!-- Tag para escrita de parágrafo -->
<div>...</div> <!-- Tag colocada em <body> que representa marca de divisão no documento; diferente de <p> não salta linha. -->
<strong>...</strong> <!-- Tag para escrita negrito -->
<input type='number' name='n1' id='n1'> <!-- Tag para designar entrada de dados do tipo número -->
<input type="submit" value="Mensagem" /> <!-- Tag para designar entrada do tipo submissão-->
<input type="reset" value="Mensagem" /> <!-- Tag para designar entrada do tipo resetar formulario-->
<input type="hidden" value="Mensagem" /> <!-- Tag para designar entrada do tipo não visivel na página-->
<input type="radio" value="Mensagem" /> <!-- Tag para designar entrada do tipo radio(marcação)-->
<input type="checkbox" value="Mensagem" /> <!-- Tag para designar entrada do tipo caixa de marcar (marcação)-->
<header>...</header> <!-- Tag colocada em <body> que representa cabeçalho da pag; parte superior da pag -->
<section>...</section> <!-- Tag colocada em <body>  que representa uma sessão na pagina -->
<footer>...</footer> <!-- Tag coloda em <body> que representa rodapé da pag -->
<ul> <li>...</li></ul> <!-- Tag para inserção de lista não ordenada; 'li' é inserido para cada elemento novo -->
<a href="meulink" >...</a> <!-- Tag pra criação de hiperlink -->
<nav> ... </nav> <!-- Tag colocada em <body> usada para separar seção de links de navegação -->
<span>...</span> <!-- Tag colocada em <body> usada para conteúdo genérico assim como <div> diferença em ser linha --> 
<form>...</form> <!-- Tag que representa seção onde haverá controles interativos, submetendo ao servidor web -->
<form method="POST">...</form> <!--Tag method altera o método do formulário. Padrão 'GET'. -->b
<form method="POST" enctype="multipart/form-data">...</form> <!-- Codifica formulário para envio de arquivos. Só funciona com método 'POST'. -->
<button>...</button> <!-- Tag criar botão em HTML -->
<main>...</main> <!-- Tag colocada em <body> usada para definir sessão de contéudo principal do body -->
<blockquote>...<\blockquote> <!-- Tag para escrita de citações -->
<table><tr><td><\td><\tr></table> <!-- Tag para representação de tabela onde <tr> = linha e <td> coluna/dados -->
<table><th>Minha Coluna1</th><th> <!-- <th> Define cabeçalho para coluna da tabela -->
<canvas id="tela" width="600" height="400"></canvas> <!-- Tag para definír área de desenho -->
<figure><figcaption>...</figcaption></figure> <!-- Tag para inserção de figuras/imagens/elementos independentes; gerealmente acompanhado com legenda -->
<fieldset>...</fieldset> <!-- Tag para campo de caixa circulada.  -->
<legend>...</legend> <!-- Define legenda para campo fieldset.  -->
<label> Meu rotulo </label> <!-- Define campo de texto. -->

~~~

---------------------
<div>
<img src="https://cdn-icons-png.flaticon.com/512/528/528255.png" alt="logocss" width="50px" height="50px"/>  
____<b>CSS</b>
</div>

~~~css
/* comentario_aqui */  /* Representa comentário em CSS */
.nomeclasse{} /* Declara estilo de Classe */
#nomeid{} /* Declara id estilo de ID */
@media print{} /* Método que define estilo CSS para impressão da pag */
~~~
---------------
<div>
<img src="https://cdn.iconscout.com/icon/free/png-256/jquery-7-1175152.png" alt="logoJS" width="50px"/>  
 ____<b>JQuery</b>
</div>  

~~~javascript
/* Uma expressão Jquery é formado por duas partes: 'o que será manipulado' + 'o que será feito' */
/* '$()' é o mesmo que 'jquery()' */
$('p').css('background-color','blue') // Método '.css' manipula estilo de elementos
$('#meulabel').val('novo texto') // Método '.val' manipula valor de elementos
$(meuarray).each(function(){};) // Método '.each' aplica função passada a cada elemento do array
$('.elem').change(function(){};) // Método '.change' monitora evento de mudança do campo; assim que mudado dispara função 
$(document).ready(function(){};) // Método de evento que é executado assim que a página é carregada
$(function(){};) //  Método de evento que é executado assim que a página é carregada
$('#meuinput').keydown(function(event){} // Método '.keydown' monitora evento de tecla; exige argumento 'event'
$('#meuinput').off('keydown') //Método '.off' remove funções associadas a um evento
$('#meuinput').off() // Método '.off' remove funções associadas a um evento
$('#meuinput').on('keydown.namespace1',function(){}) // Método '.on' cria evento com namespace 
$('#meuinput').off('keydown.namespace1') // Método irá remover evento específico passado namespace do evento

~~~ 
---------------
<div>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Bootstrap_logo.svg/2560px-Bootstrap_logo.svg.png" alt="logoJS" width="50px"/>  
 ____<b>Bootstrap</b>
</div>

* Grids (Bootstrap) : São considerados da ordem de 12 colunas ;
* `class="row"` // Classe usada para representar linhas 
* `class="col-sm-6"` // Classe que irá representar cada peçado da grid como 1/2; propridade tela pequena 'sm'
* `class="col-md-4"` // Classe que irá representar cada peçado da grid como 1/3; propridade tela média 'md'
* `class="col-lg-3"` // Classe que irá representar cada peçado da grid como 1/4; propridade tela larga 'lg'
* `class="col-xl-4"` // Classe que irá representar cada peçado da grid como 1/3; propridade tela extra larga 'xl'

--------
## Referências  
https://www.w3schools.com/  
https://developer.mozilla.org/pt-BR/  
https://getbootstrap.com/  
https://jquery.com/  

