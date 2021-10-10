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
* Instale o **Webmin** para facilitar a gerência e o monitoramento do servidor:
    * Certifique que o Perl 5 esta instalado:
      * `perl --version` 
    * Verifique o local da instalação /usr/local/bin/perl ou /usr/bin/perl
    * `cd /tmp`
    * `wget http://prdownloads.sourceforge.net/webadmin/webmin-1.981.tar.gz`
    * `gunzip webmin-1.981.tar.gz`
    * `tar xf webmin-1.981.tar`
    * `cd webmin-1.981`
    * `./setup.sh /usr/local/webmin`
    * Durante instalação Webmin solicitará algumas definições de parâmetro
    * O Webmin estará instalado e acessivel no endereço http://192.168.0.1:10000
    * Configure a conexão SSL no Webmin para acesso por HTTPS
    * Webmin > Webmin Configuration > SSL Encryption : Enable SSL
--------
## Referências
<https://www.webmin.com/tgz.html>  

