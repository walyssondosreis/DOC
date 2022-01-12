# Help JS-HTML-CSS
### (by Walysson dos Reis)
---------------------
### JS
~~~JavaScript
// Barras duplas para comentários
/* aqui */  // Representa comentário
var x // Declara variável de forma global; podendo ser undefined
let x // Declara variável presa ao escopo do bloco; economiza memória; podendo ser undefined
const x // Declara constante global ; não podendo ser undefined
typeof(x) // Retorna tipo da variável 'x'
x>2 ? 'SIM':'NÃO' // Exemplo de uso do operador ternário
function minhaFuncao(){} // Declara função em JS
console.log('Escrevendo') // Escreve no console JS
var x={} // Declara variável de objeto em JS; equivale a Dicionário em python
~~~
#### CONDIÇÕES
~~~javascript
if(){} // Escopo de declaração de condicional SE em JS
switch(condição){ // Espoco de declaração da condição múltipla
  case 1: ... break // Condição 1 ; sempre interromper loop com break
  case 2: ... break //  Condição 2 ; sempre interromper loop com break
  case n: ... break // Condição n ; sempre interromper loop com break
  default: ... break }// Condição padrão caso não atenda a nenhum caso anterior
~~~
#### LAÇOS
~~~javascript
while(){} //Escopo de declaração de laço WHILE
do{}while() // Escopo de declaração de laço DO WHILE
for(incio;teste;Incremento){} // Escoppo de declaração de laço FOR
~~~
#### STRING
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
### ARRAYS
~~~javascript
/* Alguns métodos de string também funcionam para vetores e vice versa */
var x=[] // Declara array
x.push() // Adiciona elemento ao array
x.pop() // Remove elemento do array
x.legth // Atributo que retorna comprimento(qtd de posições) do array 
x.sort() // Método que ordena array
~~~
#### DOM (Document Object Model)
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
### HTML5
~~~html
<!-- Meu Comentario --> // Representa comentário em HTML5
<br> // QUebra de linha 
<html>...</html> // Tag de abertura de documento HTML
<head>...</head> // Tag colocada em <html> que representa as declarações da pag.
<title>...</title> // Tag colocada em <head> que representa o título da pag html
<style>...</style> // Tag colocada em <head> para abertura de cod. CSS.
<body>...</body> // Tag colocada em <html> que representa o corpo do documento ;  onde fica basicamente todo conteúdo da pag.
<body onload='minhafuncao()' ... // Evento de carregamento da página
<link rel="stylesheet" href="style.css"> // Tag colocada em <head> para ligar arquivo HTML ao arq CSS externo
<script src="script.js"></script> // Tag que representa a ligação do HTML com um arquivo externo JS
<h1>...</h1> // Tag para escrita de título
<p>...</p> // Tag para escrita de parágrafo
<div>...</div> // Tag colocada em <body> que representa marca de divisão no documento; diferente de <p> não salta linha.
<strong>...</strong> // Tag para escrita negrito
<input type='number' name='n1' id='n1'> // Tag para designar entrada de dados do tipo número
<header>...</header> // Tag colocada em <body> que representa cabeçalho da pag; parte superior da pag
<section>...</section> // Tag colocada em <body>  que representa uma sessão na pagina
<footer>...</footer> // Tag coloda em <body> que representa rodapé da pag 
<ul> <li>...</li></ul> // Tag para inserção de lista não ordenada; 'li' é inserido para cada elemento novo
<a href="meulink" >...</a> // Tag pra criação de hiperlink
<nav> ... </nav> // Tag colocada em <body> usada para separar seção de links de navegação
<span>...</span> // Tag colocada em <body> usada para conteúdo genérico assim como <div> diferença em ser linha 
<form>...</form> // Tag que representa seção onde haverá controles interativos, submetendo ao servidor web
<button>...</button> // Tag criar botão em HTML
<main>...</main> // Tag colocada em <body> usada para definir sessão de contéudo principal do body
~~~
### CSS
~~~css
/* aqui */  // Representa comentário em CSS
.nomeclasse{} // Declara estilo de Classe
#nomeid{} // Declara id estilo de ID
~~~
