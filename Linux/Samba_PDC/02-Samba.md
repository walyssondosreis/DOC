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
      * `sudo systemctl stop samba-ad-dc.service smbd.service nmbd.service winbind.service`
      * `sudo systemctl disable samba-ad-dc.service smbd.service nmbd.service winbind.service`
    * Faça backup do arquivo de configuração original do samba:
      * `sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.initial`
    * Inicie o provisionamento do domínio:
      * `sudo samba-tool domain provision --use-rfc2307 --interactive`
        * Opções a serem configuradas no aprovisionamento:
        * Realm: MEUDOMINIO.LAN *(Digite em Maiúsculo)*
        * Domain: *(Manter padrão: Apenas Confirme)*
        * Server Role : *(Manter padrão: Apenas Confirme)*
        * DNS backend : *(Manter padrão: Apenas Confirme)*
        * DNS forwarder: 192.164.0.254
        * Administrator password: *(Digite uma senha Forte)*
    * Faça backup do arquivo conf Kerberos e copie o novo:
      * `sudo mv /etc/krb5.conf /etc/krb5.conf.initial`
      * `sudo ln -s /var/lib/samba/private/krb5.conf /etc/`
    * Habilite novamente os servidos do Samba:
      * `sudo systemctl start samba-ad-dc.service`
      * `sudo systemctl enable samba-ad-dc.service`

~~~
* 

===============================================

===============================================
# Configuração de DNS no domínio
* Verificar nível de domínio compativel com Windows Server 2008 R2
sudo samba-tool domain level show
* Configure DNS no arquivo Interfaces
sudo mcedit /etc/network/interfaces
* Adicione ao arquivo:
dns-nameservers 127.0.0.1 172.31.32.203
dns-search voxconexao.lan
* Configure o DNS no arquivo Resolv.conf
sudo mcedit /etc/resolv.conf
* Adicione ao arquivo:
nameserver 172.31.32.203
nameserver 172.31.32.10
search voxconexao.lan
* Reinicie o servidor 
===============================================
# Testando Domínio
ping -c3 voxconexao.lan           #Domain Name 
ping -c3 ntvox01.voxconexao.lan   #FQDN 
ping -c3 ntvox01                  #Host
* Execute consultas no Samba AD
host -t A voxconexao.lan
host -t A ntvox01.voxconexao.lan
host -t SRV _kerberos._udp.voxconexao.lan # UDP Kerberos SRV record
host -t SRV _ldap._tcp.voxconexao.lan # Registro TCP LDAP SRV
* Verifique a autenticação no Kerberos
kinit administrator@VOXCONEXAO.LAN
klist  # Lista usuários autenticados

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
https://purainfo.com.br/configurando-endereo-ip-esttico-no-ubuntu-server-derivados/  
https://www.edivaldobrito.com.br/instalar-o-webmin-no-ubuntu/  
https://www.vivaolinux.com.br/dica/resolv.conf-com-servidor-DNS-fixo-%28sem-gambiarra%29  
https://askubuntu.com/questions/143819/how-do-i-configure-my-static-dns-in-interfaces  
https://www.terralab.com.br/lib/exe/fetch.php?media=terralab:tecnologias:tutorial_samba.pdf  
https://ubuntuforum-br.org/index.php?topic=51291.0  
https://www.vivaolinux.com.br/dica/Samba-Carregar-wallpaper-nas-estacoes-Windows-durante-logon  
https://www.tecmint.com/install-samba4-active-directory-ubuntu/  
