# SAMBA 4 Active Directory Domain Controller
## Instalação e configuração do servidor linux

* Distribuição linux utilizada: *Ubuntu 16.04.7 Server*  
    * Particionamento recomendado para servidor:
      * **/swap**: Equivalente a memória RAM 
      * **/boot**: 500 Mb
      * **/** : Minímo 100 Gb
      * **/home**: Restante disponível de armazenamento

* Habilite e logue como root para facilitar as alterações que serão feitas:  
    * `sudo passwd root`
    * `exit` 
* Instale alguns pacotes necessários:  
    * `apt install openssh-server`
    * `apt install apt-transport-https`
    * `apt install proftpd`
    * `apt install mc`
    * `apt install tree`
* Configure a permissão de login root via SSH:
    * `mcedit /etc/ssh/sshd_config`
    * Altere a linha para: *PermitRootLogin* **yes** 
* Configure o IP fixo no servidor linux:
    * `mcedit /etc/network/interfaces`
    * Altere a configuração referente a placa de rede eth0 (Nome da placa pode variar) como a baixo:
      ~~~ 
      auto eth0 
      iface eth0 inet static
          address 192.168.0.1
          netmask 255.255.255.0
          network 192.168.0.0
          broadcast 192.168.0.255
          gateway 192.168.0.254
          dns-nameserver 192.168.168.254
          dns-nameserver 8.8.8.8
      ~~~
    * Reinicie o serviço de rede:
    * `/etc/init.d/networking restart`

* Instale o Servidor de tempo NTP
    * apt-get install ntp ntpdate

--------
## Referências
https://purainfo.com.br/configurando-endereo-ip-esttico-no-ubuntu-server-derivados/  


