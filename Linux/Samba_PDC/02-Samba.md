# SAMBA 4 Active Directory Domain Controller  
## Instalação e configuração do Samba modo AD-DC

1. Acesso aos compartilhamentos do domínio Samba AD-DC:
    * **\\\meudominio.lan** - Leva aos compartilhamentos do domínio (SEM ACESSO AS PASTAS)
    * **\\\srv.meudominio.lan** - Leva aos compartilhamentos da máquina servidor
    * **\\\192.168.0.1** - Leva aos compartilhamentos da máquina servidor
    * **\\\srv** - Leva aos compartilhamentos da máquina servidor
 
1. Diretórios importantes para o Samba AD-DC:
    * **/etc/samba** : Local do arquivo de configuração samba (smb.conf)
    * **/home/sysvol/meudominio.lan/Scripts** : Local dos script de logon nos terminais
    * **/home/sysvol/meudominio.lan/Profiles** : Local dos arquivos de perfil do usuário
    * **/home/sysvol/meudominio.lan/Polices** : Local das diretivas de segurança do AD
    * **/home/sysvol/meudominio.lan/Logs** : Local dos arquivos de log via auditoria
    * **/home/sysvol/meudominio.lan/Arquivos** : Local das pastas compartilhadas
    * **/home/sysvol/meudominio.lan/Recycle** : Local de lixeira das pastas compartilhadas
    * **/var/lib/samba/sysvol** : Local Original de Volume Montado pelo Samba
1. Instale o Samba:
    * `apt install samba krb5-user krb5-config winbind libpam-winbind libnss-winbind`
    * Opções a serem definidas na instalação:
      * Default Kerberos version 5 realm: MEUDOMINIO.LAN  *(Digite em Maiúsculo)*
      * Servidores Kerberos para seu realm: meudominio.lan
      * Servidor administrativo para seu realm Kerberos: meudominio.lan
1. Faça o provisionamento do Samba AD:
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
        * DNS forwarder: 192.164.0.254 *(Gateway)*
        * Administrator password: *(Digite uma senha Forte)*
    * Faça backup do arquivo conf Kerberos e copie o novo:
      * `mv /etc/krb5.conf /etc/krb5.conf.initial`
      * `ln -s /var/lib/samba/private/krb5.conf /etc/`
    * Habilite novamente os servidos do Samba:
      * `systemctl enable samba-ad-dc.service`
      * `systemctl start samba-ad-dc.service`
1. Configuração de DNS no domínio:
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
1. O serviço wimbindd já esta incluso no samba, portanto desabilite o serviço antigo:
    * `systemctl disable winbind.service`
    * `systemctl stop winbind.service`
1. Testando domínio aprovisionado:
    * `ping -c3 meudominio.lan`     *(Solicita nome de domínio)* 
    * `ping -c3 srv`                *(Solicita nome do servidor local)*
    * `ping -c3 srv.meudominio.lan` *(Solicita FQDN)*
    * Execute consultas no Samba AD-DC:
      * `host -t A meudominio.lan`
      * `host -t A srv.meudominio.lan`
      * `host -t SRV _kerberos._udp.meudominio.lan` 
      * `host -t SRV _ldap._tcp.meudominio.lan` 
    * Verifique a autenticação no Kerberos:
      * `kinit administrator@MEUDOMINIO.LAN`
      * `klist`  *(Lista usuários autenticados)*
1. Autenticação local Samba usando contas de usuários do domínio:
    * Adicione ao arquivo smb.conf na sessão global:
    	*  mcedit /etc/samba/smb.conf 
    	 ~~~
	  template shell = /bin/bash
	  winbind use default domain = true
	  winbind offline logon = false
	  winbind nss info = rfc2307
	  winbind enum users = yes
	  winbind enum groups = yes
     	 ~~~
    * `testparm`
    * `systemctl restart samba-ad-dc.service`
    * `pam-auth-update`
    * Marque todas as opções
    * Edite o arquivo *nsswitch.conf* e adicione as linhas de *passwd* e *group*:
    * `mcedit /etc/nsswitch.conf`
    ~~~
    passwd: compat winbind
    group:  compat winbind
    ...
    ~~~
    * `mcedit /etc/pam.d/common-password`
    * Remova use_authtok da linha:
    ~~~
    password [success=1 default=ignore] pam_winbind.so try_first_pass
    ~~~
    * Sempre que o modulo PAM for atualizado este ultimo passo deverá ser feito

1. Instale e configure o Servidor de tempo NTP:
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

* **OBS: Ao criar diretórios e arquivos para utilização do Samba considere:** 
	* `chmod -R 775 meudiretorio` - *Altera permissões de acesso, leitura e escrita para diretório/arquivo*
	* `chown -R root:"domain users" meudiretorio` - *Atribui proprietário e grupo ao diretório/arquivo*
	* `ls -alh | grep meudiretorio` - *Exibe as permissões e propriedades do diretório/arquivo*
* **OBS: Ao se deparar erros de acesso a pastas e arquivos no Windows, certifique das permissões de segurança**

## Arquivo SMB.CONF:
~~~
# SAMBA ACTIVE DIRECTORY CONTROLLER DOMAIN
# by Walysson Pereira dos Reis @walyssondosreis

# Parametros Globais

[global]
	workgroup = MEUDOMINIO
	realm = MEUDOMINIO.LAN
	netbios name = SRV
	server role = active directory domain controller
	dns forwarder = 192.168.0.254 # Gateway
	idmap_ldb:use rfc2307 = yes
	template shell = /bin/bash
	winbind use default domain = true
	winbind offline logon = false
	winbind nss info = rfc2307
	winbind enum users = yes
	winbind enum groups =yes
	vfs objects = recycle
	recycle:repository = /home/sysvol/meudominio.lan/Recycle/%U/%S
	recycle:keeptree = yes
	recycle:versions = yes
	recycle:exclude = *.~*, ~*.*, *.bak, *.old, *.iso, *.tmp, *.temp, *.log, *ldb, *.o, *.obj
	recycle:exclude_dir = temp,cache,tmp
	recycle:maxsize = 100

#================================================
# Compartilhamento de pastas do Samba-AD-DC

[sysvol]
	comment = Volume do Sistema
	browseable = No
	path = /home/sysvol
	read only = No
[netlogon]
	comment = Servico de Logon
	browseable = No
	path = /home/sysvol/meudominio.lan/Scripts
	read only = No
[profiles]
	comment = Perfis dos Usuarios
	browseable = No
	path = /home/sysvol/meudomino.lan/Profiles
	read only = No
[homes]
	comment = Pasta Home do usuário Samba
	browseable = No
	root preexec = su - %U ; exit
	path = /home/%D/%U
	read only = No
#=================================================
# Compartilhamentos de Pastas

[Minha Pasta Compartilhada]
	comment = Pasta Compartilhada
	browseable = yes 
	path = /home/sysvol/meudominio.lan/Arquivos/MinhaPasta  
	read only = No
~~~
-------------
## Referências:
https://www.hardware.com.br/artigos/samba-dominio/   
https://www.hardware.com.br/livros/linux-redes/usando-samba-como-controlador-dominio-pdc.html  
https://wiki.samba.org/index.php/Setting_up_Samba_as_an_Active_Directory_Domain_Controller  
https://guiafoca.org/guiaonline/avancado/ch18s07.html  
http://www.bosontreinamentos.com.br/linux/samba-4-como-addc/  
http://www.bosontreinamentos.com.br/linux/samba-4-instalacao-e-provisionamento/  
https://sites.google.com/site/professorandrecampos/projeto-de-redes/samba---li  
https://www.guiafoca.org/guiaonline/avancado/ch18s14.html  
https://guiafoca.org/guiaonline/avancado/ch18s07.html#s-samba-dom-contasmac  
https://www.tecmint.com/install-samba4-active-directory-ubuntu/  
https://www.blogdainformatica.com.br/configurando-uma-lixeira-no-servidor-samba-linux-auditoria/  
https://www.vivaolinux.com.br/dica/Lixeira-no-Samba  
https://lucasatrindade.wordpress.com/2018/06/05/auditando-logs-samba4/  
https://www.hardware.com.br/tutoriais/samba-configuracao-avancada/pagina7.html  
https://hamacker.wordpress.com/2007/08/15/servidor-samba-lixeira-e-auditoria/  
https://www.hardware.com.br/comunidade/pasta-home/1385186/  
https://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/  
