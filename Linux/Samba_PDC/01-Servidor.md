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
    * Gere o certificado SSL/TLS para o servidor FTP:
      * `mkdir /etc/ssl/private`
      * `openssl req -x509 -nodes -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -days 365 -newkey rsa:2048`
      * OBS: Durante a geração do certificado será gerado um questionário, responda conforme necessário.
    * Crie a lista de bloqueio de usuários do vsFTPd:
      * `touch /etc/vsftpd.userlist`
    * Faça uma cópia de segurança do arquivo vsFTPd:
      * `cp /etc/vsftpd.conf /etc/vsftpd.conf.initial` 
    * Abra para edição o arquivo de configuração do vsFTPd:
      * `mcedit /etc/vsftpd.conf`
      * Certifique de estar ativo (descomentado '#') no arquivo os seguintes parâmetros:
         ~~~
         listen=NO
         listen_ipv6=YES
         anonymous_enable=NO
         local_enable=YES
         write_enable=YES
         local_umask=022
         dirmessage_enable=YES
         xferlog_enable=YES
         connect_from_port_20=YES
         xferlog_std_format=YES
         pam_service_name=vsftpd
         ~~~
      * Adicione os seguintes parâmetros ao final do arquivo:
         ~~~
         tcp_wrappers=YES
         userlist_enable=YES 
         userlist_deny=YES
         userlist_file=/etc/vsftpd.userlist
         ssl_enable=YES
         ssl_tlsv1=YES
         ssl_sslv2=NO
         ssl_sslv3=NO
         allow_anon_ssl=NO
         force_local_data_ssl=YES
         force_local_logins_ssl=YES
         require_ssl_reuse=NO
         ssl_ciphers=HIGH
         pasv_min_port=40000
         pasv_max_port=50000
         debug_ssl=YES
         ~~~
      * Comente as linhas e adicione as entradas conforme abaixo:
         ~~~
         #rsa_cert_file=/etc/ssl/private/ssl-cert-snakeoil.pem
         #rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
         #ssl_enable=NO
         rsa_cert_file=/etc/ssl/private/vsftpd.pem
         rsa_private_key_file=/etc/ssl/private/vsftpd.pem
         ~~~
    * Certifique de remover o usuário root das listas de bloqueio:
      * `mcedit /etc/ftpusers`
      * `mcedit /etc/vsftpd.userlist`
    * Reinicie os serviços vsFTPd:
      * `systemctl restart vsftpd`
      * `service vsftpd restart`
    * OBS: O acesso FTP é feito atráves de programas como Filezilla
    * OBS: No acesso certifique do parâmetro: Requer FTP sobre TLS Explicito
--------
## Referências
https://purainfo.com.br/configurando-endereo-ip-esttico-no-ubuntu-server-derivados/  
http://www.bosontreinamentos.com.br/linux/como-configurar-endereco-ip-estatico-no-linux-ubuntu-18-04-com-netplan/  
https://www.tecmint.com/install-ftp-server-in-ubuntu/  
https://serverfault.com/questions/34678/how-to-configure-vsftpd-to-allow-root-logins  
https://www.tecmint.com/secure-ftp-server-using-ssl-tls-on-ubuntu/  
