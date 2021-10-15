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
* Instale os pacotes utilitários:  
    * `apt install openssh-server`
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

* Instale e configure o Servidor de tempo NTP:
    * `apt-get install ntp ntpdate`
    * `mcedit /etc/ntp.conf`
    * Verique no site https://www.pool.ntp.org/ a zona de NTP mais próxima a sua região
    * Substitua no arquivo aberto os servidos padrão pelos verificados:
     ~~~
     server 0.south-america.pool.ntp.org iburst
	  server 1.south-america.pool.ntp.org iburst
	  server 2.south-america.pool.ntp.org iburst
	  server 3.south-america.pool.ntp.org iburst
     ~~~
    * Ainda com arquivo aberto vá uma linha abaixo da instrução driftfile e adicione:
     ~~~
     ntpsigndsocket /var/lib/samba/ntp_signd/
     ~~~
    * Vá ao final do arquivo e adicione a linha. após isso feche e salve o arquivo:
     ~~~
     restrict default kod nomodify notrap nopeer mssntp
     ~~~
    * `chown root:ntp /var/lib/samba/ntp_signd/` - *Altera grupo dono da pasta NTP para o Samba
    * `chmod 750 /var/lib/samba/ntp_signd/` - *Altera permissões da pasta NTP para o Samba*
    * `systemctl restart ntp`  - *Reinicia serviço NTP*
    * `netstat –tulpn | grep ntp` - *Verifica se o NTP tem sockets abertos na tabela de rede*
    * `ntpq -p` - *Verica o serviço NTP*

--------
## Referências
https://purainfo.com.br/configurando-endereo-ip-esttico-no-ubuntu-server-derivados/  
http://www.bosontreinamentos.com.br/linux/como-configurar-endereco-ip-estatico-no-linux-ubuntu-18-04-com-netplan/  
https://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/


