# SAMBA 4 Active Directory Domain Controller
## Instalação e configuração do servidor linux

1. Distribuição linux utilizada: *Ubuntu 16.04.7 Server*  
    * Particionamento recomendado para servidor:
      * **/swap**: Equivalente a memória RAM 
      * **/boot**: 500 Mb
      * **/** : Minímo 100 Gb
      * **/home**: Restante disponível de armazenamento

1. Habilite e logue como root para facilitar as alterações que serão feitas:  
    * `sudo passwd root`
    * `exit` 
1. Configure o IP fixo no servidor linux:
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
1. Instale os pacotes utilitários:  
    * `apt install openssh-server`
    * `apt install vsftpd`
    * `apt install smbclient`
    * `apt install mc`
    * `apt install tree`
1. Configure a permissão de login root via SSH:
    * `mcedit /etc/ssh/sshd_config`
    * Altere a linha para: *PermitRootLogin* **yes** 

1. Configure o servidor FTP:
    * Habilite os serviços do vsFTPd:
      * `systemctl start vsftpd`
      * `systemctl enable vsftpd`
      * `service vsftpd start`
      * `chkconfig --level 35 vsftpd on`
    * Adicione regras de excessão ao firewall:
      * `ufw allow 20/tcp`
      * `ufw allow 21/tcp`
      * `ufw allow 990/tcp`
      * `ufw allow 40000:50000/tcp`
      * `ufw status`
    * Faça uma cópia de segurança do arquivo vsFTPd:
      * `sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.initial` 
    * Abra para edição o arquivo de configuração do vsFTPd:
      * `mcedit /etc/vsftpd.conf`
--------
## Referências
https://purainfo.com.br/configurando-endereo-ip-esttico-no-ubuntu-server-derivados/  
http://www.bosontreinamentos.com.br/linux/como-configurar-endereco-ip-estatico-no-linux-ubuntu-18-04-com-netplan/  
https://www.tecmint.com/install-ftp-server-in-ubuntu/  
https://serverfault.com/questions/34678/how-to-configure-vsftpd-to-allow-root-logins  
https://www.tecmint.com/secure-ftp-server-using-ssl-tls-on-ubuntu/  
