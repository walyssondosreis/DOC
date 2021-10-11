# SAMBA 4 Active Directory Domain Controller  
## Instalação e configuração do Samba modo AD-DC

* Diretórios importantes para o Samba AD-DC:
    * **/etc/samba/** : Local onde fica o arquivo de configuração samba (smb.conf)
    * **/var/samba/netlogon/** : Local onde fica o script de logon nos terminais
    * **/var/profiles/** : Local onde fica os arquivos de perfil do usuário
* Instale o Samba:
    * `apt install samba krb5-user krb5-config winbind libpam-winbind libnss-winbind`
    * Opções a serem definidas na instalação:
      * Default Kerberos version 5 realm: MEUDOMINIO.LAN  *(Digite em Maiúsculo)*
      * Servidores Kerberos para seu realm: meudominio.lan
      * Servidor administrativo para seu realm Kerberos: meudominio.lan
* Faça o provisionamento do Samba AD:
    * Antes de continuar desabilite os serviços do samba:
      * `systemctl stop samba-ad-dc.service smbd.service nmbd.service winbind.service`
      * `systemctl disable samba-ad-dc.service smbd.service nmbd.service winbind.service`
    * Faça backup do arquivo de configuração original do samba:
      * `mv /etc/samba/smb.conf /etc/samba/smb.conf.initial`
    * Inicie o provisionamento do domínio:
      * `samba-tool domain provision --use-rfc2307 --interactive`
        * Opções a serem configuradas no aprovisionamento:
        * Realm: MEUDOMINIO.LAN *(Digite em Maiúsculo)*
        * Domain: *(Manter padrão: Apenas Confirme)*
        * Server Role : *(Manter padrão: Apenas Confirme)*
        * DNS backend : *(Manter padrão: Apenas Confirme)*
        * DNS forwarder: 192.164.0.254
        * Administrator password: *(Digite uma senha Forte)*
    * Faça backup do arquivo conf Kerberos e copie o novo:
      * `mv /etc/krb5.conf /etc/krb5.conf.initial`
      * `ln -s /var/lib/samba/private/krb5.conf /etc/`
    * Habilite novamente os servidos do Samba:
      * `systemctl start samba-ad-dc.service`
      * `systemctl enable samba-ad-dc.service`
* Configuração de DNS no domínio:
    * Verifique o nível do domínio aprovisionado se é compativel ao *Windows Server 2008 R2*:
      * `samba-tool domain level show`
    * Configure o DNS no arquivo *interfaces*:
      * `mcedit /etc/network/interfaces`
      * Adicione ao arquivo:
         ~~~
         dns-nameservers 127.0.0.1 192.168.0.254
         dns-search meudominio.lan
         ~~~
    * Configure o DNS no arquivo *resolv.conf*:
      * `mcedit /etc/resolv.conf`
      * Adicione ao arquivo:
         ~~~
         nameserver 192.168.0.254
         nameserver 192.168.0.1
         search meudominio.lan
         ~~~
    * Reinicie o serviço de rede:
      * `/etc/init.d/networking restart`

* Testando domínio aprovisionado:
    * `ping -c3 meudominio.lan`     *(Solicita nome de domínio)* 
    * `ping -c3 srv`                *(Solicita nome do servidor local)*
    * `ping -c3 srv.meudominio.lan` *(Solicita FQDN)*
    * Execute consultas no Samba AD-DC:
      * `host -t A meudominio.lan`
      * `host -t A srv.meudominio.lan`
      * `host -t SRV _kerberos._udp.meudominio.lan` 
      * `host -t SRV _ldap._tcp.meudominio.lan` 
    * Verifique a autenticação no Kerberos:
      * `kinit administrator@VOXCONEXAO.LAN`
      * `klist`  *(Lista usuários autenticados)*

~~~
===============================================
# Definir permisões e diretórios para usuários Samba
sudo smbpasswd -a root
sudo mkdir -p /var/samba/netlogon
sudo chmod 775 /var/samba/netlogon/ 
sudo mkdir /var/profiles  # Criar diretório onde ficará os arq perf do usuario.
sudo chmod 777 /var/profiles
===============================================
# Criar arquivo netlogon.bat em /var/samba/netlogon/
sudo touch /var/samba/netlogon/netlogon.bat
sudo mcedit /var/samba/netlogon/netlogon.bat
-------------------------------------------------
# netlogon.bat
-------------------------------------------------
net use H: /HOME
net time \\srvPDC /set /yes
-------------------------------------------------
===============================================
# Alterar Script de logon p/ aplicar Wallpaper em terminais
> Editar smb.conf colocando em [global] logon script = logon.cmd
> Copiar arquivo logon.cmd para diretório /var/samba/netlogon/
* A imagem para papel de parede deve ser salva em um diretório q será montado p/ usuário
* A imagem para papel de parede só pode ser .bmp (Bitmap)
===============================================
~~~
-------------
## Referências:
https://www.hardware.com.br/artigos/samba-dominio/  
https://www.terralab.com.br/lib/exe/fetch.php?media=terralab:tecnologias:tutorial_samba.pdf  
https://ubuntuforum-br.org/index.php?topic=51291.0  
https://www.vivaolinux.com.br/dica/Samba-Carregar-wallpaper-nas-estacoes-Windows-durante-logon  
https://www.tecmint.com/install-samba4-active-directory-ubuntu/

