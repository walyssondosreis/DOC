# SAMBA 4 Active Directory Domain Controller  
## Gerenciamento Servidor Samba-AD-DC

* Cadastrar máquina no dominio:
  * `useradd -d /dev/null -s /bin/false meupc$`
  * `passwd -l meupc$`
  * `smbpasswd -a -m meupc`

* Cadastrar máquina já adicionando em um grupo existente:
  * `sudo useradd -g meugrupo -d /dev/null -s /bin/false meupc$` 
  * `sudo passwd -l meupc$`
  * `sudo smbpasswd -a -m meupc`
  * Obs: O cadastro de máquina só é necessário para terminais Windows.

* Cadastrar usuario no dominio:
  * `sudo adduser meuusuario`
  * `sudo smbpasswd -a meuusuario`

* Comandos uteis
  * `sudo /etc/init.d/samba/ start` - *Inicia serviço do Samba*
  * `sudo /etc/init.d/samba/ restart`  - *Reinicia serviço do Samba*
  * `sudo /etc/init.d/samba/ stop` - *Interrompe serviço do Samba*
  * `sudo systemctl start samba-ad-dc.service` - *Inicia serviço do Samba*
  * `sudo systemctl restart samba-ad-dc.service` - *Reinicia serviço do Samba*
  * `sudo systemctl stop samba-ad-dc.service` - *Interrompe serviço do Samba*
  * `smbstatus` - *Retorna informações de login de usuários no domínio*
  * `testparm` - *Verifica se há erros no arquivo smb.conf*

~~~
samba-tool -h # Exibe todas as opções da ferramenta samba tool
samba-tool user add meuusuario  # Cria usuario no Samba
samba-tool user add -h  
samba-tool user add your_domain_user --given-name = your_name --surname = your_username --mail-address=your_domain_user@tecmint.lan --login-shell = /bin/bash
samba-tool user list # Lista todos os usuarios Samba do dominio
samba-tool user delete your_domain_user # Exclui usuario do samba
samba-tool user setpassword your_domain_user # Redefinir senha usuario samba
samba-tool user disable your_domain_user # Desabilita usuario samba
samba-tool user enable your_domain_user # Habilita usuario samba
samba-tool group add –h  
samba-tool group add your_domain_group
samba-tool group delete your_domain_group
samba-tool group list
samba-tool group listmembers "grupo seu_dominio"
samba-tool group addmembers your_domain_group your_domain_user
samba-tool group remove members your_domain_group your_domain_user
* Alterar Politica de Senhas do Domínio
samba-tool domain passwordsettings show
samba-tool domain passwordsettings -h 
samba-tool domain passwordsettings set --complexity=off
samba-tool domain passwordsettings set --history-length=0
samba-tool domain passwordsettings set --min-pwd-age=0
samba-tool domain passwordsettings set --max-pwd-age=0
samba-tool domain passwordsettings set --min-pwd-length=4
===============================================

* O Servido wimbindd já esta incluso no samba , portanto remova o serviço antigo 
sudo systemctl disable winbind.service
sudo systemctl stop winbind.service
# Usando wbinfo para consulta de usuarios e grupos ferramento do serviço wimbindd
wbinfo -g
wbinfo -u
wbinfo -i your_domain_user
getent passwd | grep TESTE
getent group | grep TESTE
===============================================

usermod -aG sudo 'DOMAIN\your_domain_user' # Coloca usuado samba ao grupo sudo e dá privilegios root no sistema local
* Para dar privilégios root a todos os usuario de um grupo adicione a linha ao arquivo apos a linha privilegios de root
sudo mcedit /etc/sudoers
%TESTE\\domain\ meugrupo ALL=(ALL:ALL) ALL

===============================================

# Visualizar usuarios no ubuntu

less /etc/passwd
*Apenas nomes de Usuarios
cut -d : -f 1 /etc/passwd

# Visualizar grupos no ubuntu
less /etc/group
cut -d : -f 1 /etc/group

# Visualizar usuarios logados na maq local
w
who
~~~
--------------
## Referências:
https://www.tecmint.com/manage-samba4-active-directory-linux-command-line/  
https://www.hostinger.com.br/tutoriais/usuarios-sistema-linux  
