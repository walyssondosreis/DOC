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
      * `systemctl enable samba-ad-dc.service`
      * `systemctl start samba-ad-dc.service`
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
* O serviço wimbindd já esta incluso no samba, portanto desabilite o serviço antigo:
    * `systemctl disable winbind.service`
    * `systemctl stop winbind.service`
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
* No Webmin atualize os módulos:
    * Menu Esquerdo > Refresh Modules 

## Arquivo SMB.CONF:
~~~
# PDC 
# by Walysson dos Reis

[global]
	logon home = \\%L\%U\.profiles
	local master = yes
	preferred master = yes
	domain logons = yes
ok	workgroup = vox
	ntlm auth = yes
ok	netbios name = ntvox01
	client lanman auth = yes
	server string = Dominio Vox Conexao
	domain master = yes
	use client driver = yes
	os level = 100
	security = user
	client ntlmv2 auth = yes
	logon path = \\%L\profiles\%U
	logon script = logon.cmd
#	logon script = netlogon.bat 
	encrypt passwords = yes
	lanman auth = yes
	server max protocol = NT1

[netlogon]
	browseable = no
	comment = Servico de Logon
	path = /var/samba/netlogon

[homes]
	valid users = %S
	comment = Diretorio Home
	writeable = yes
	public = yes
	browseable = No

[profiles]
	path = /home/.profiles
	create mask = 0650
	directory mask = 0750
	available = yes
	browseable = no
	public = no
	writable = yes
 
[Publico]
	writeable = yes
	public = yes
	comment = Area publica do dominio
	path = /home/vox/publico

[Auditoria]
	path = /home/vox/auditoria
	write list = @auditoria
	valid users = @auditoria

[Central Gerencia de Redes]
	path = /home/vox/cgr
	write list = @cgr
	valid users = @cgr

[Comercial]
	path = /home/vox/comercial
	write list = @comercial
	valid users = @comercial

[Compras]
	path = /home/vox/compras
	write list = @compras
	valid users = @compras

[Diretoria]
	path = /home/vox/diretoria
	write list = @diretoria
	valid users = @diretoria

[Departamento Pessoal]
	path = /home/vox/dp
	write list = @dp
	valid users = @dp

[Financeiro]
	path = /home/vox/financeiro
	write list = @financeiro
	valid users = @financeiro

[Financeiro Gerencia]
	path = /home/vox/financeirogr
	write list = @financeiro_ger
	valid users = @financeiro_ger

[Central de Relacionamentos]
	path = /home/vox/cr
	write list = @cr
	valid users = @cr

[LGPD]
	path = /home/vox/lgpd
	write list = @lgpd
	valid users = @lgpd

[Marketing]
	path = /home/vox/marketing
	write list = @marketing
	valid users = @marketing

[Operacoes]
	path = /home/vox/operacoes
	write list = @operacoes
	valid users = @operacoes

[RAC]
	path = /home/vox/rac
	write list = @rac
	valid users = @rac

[RH_RAC]
	path = /home/vox/rh_rac
	write list = @rh_rac
	valid users = @rh_rac

[Vendas a Distancia]
	path = /home/vox/vad
	write list = @vad
	valid users = @vad

[Recursos Humanos]
	path = /home/vox/rh
    write list = @rh
	valid users = @rh

[RH_DEV]
	path = /home/vox/rh_dev
	write list = @rh_dev
	valid users = @rh_dev

[Tecnologia da Informacao]
	path = /home/vox/ti
	write list = @ti
	valid users = @ti

~~~
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

