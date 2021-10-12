# SAMBA 4 Active Directory Domain Controller  
## Gerenciamento Servidor Samba-AD-DC

* Criar conta de máquina no dominio:
  * `useradd -d /dev/null -s /bin/false meupc$`
  * `passwd -l meupc$`
  * `smbpasswd -a -m meupc`

* Criar conta de máquina já adicionando em um grupo existente:
  * `sudo useradd -g meugrupo -d /dev/null -s /bin/false meupc$` 
  * `sudo passwd -l meupc$`
  * `sudo smbpasswd -a -m meupc`
  * Obs: O cadastro de máquina só é necessário para terminais Windows.

* Manipulação de **Usuários Samba**:
  * `adduser meuusuario` - *Cria usuário no servidor local*
  * `smbpasswd -a meuusuario` - *Adiciona usuário criado a lista de usuários do Samba*
  * `samba-tool user add meuusuario`  - *Cria usuario*
  * `samba-tool user add -h`  - *Ajuda para o comando*
  * `samba-tool user delete meusuario`  - *Deleta usuario*
  * `samba-tool user list`  - *Lista usuarios*
  * `samba-tool user setpassword meuusuario` - *Redefine senha de usuário*
  * `samba-tool user disable meusuario` - *Desabilita usuario*
  * `samba-tool user enable meuusuario` - *Habilita usuario*

* Logando com usuário do Samba-AD-DC no servidor local:
  * su - meusuario
  * Será exibida a mensagem a primeira vez informado ter sido criado pasta do usuario. 
  * id - Mostra id do usuario logado
  * passwd - Troca senha do usuario Samba logado.

* Manipulação de **Grupos Samba**:
  * `samba-tool group add –h` - *Ajuda para o comando*  
  * `samba-tool group add meugrupo` - *Cria grupo* 
  * `samba-tool group delete meugrupo` - *Deleta grupo*
  * `samba-tool group list` - *Lista grupos*
  * `samba-tool group listmembers meugrupo` - *Lista membros de um grupo*
  * `samba-tool group addmembers meugrupo meuusuario` - *Adiciona usuário a grupo*
  * `samba-tool group remove members meugrupo meuusuario` - *Remove usuário de grupo*

* Manipulação de **Politica de Senhas do Domínio**:
  * `samba-tool domain passwordsettings show` - *Exibe definições de política de senha*
  * `samba-tool domain passwordsettings -h` - *Ajuda para o comando*
  * `samba-tool domain passwordsettings set --complexity=off` - *Altera complexidade de senha*
  * `samba-tool domain passwordsettings set --history-length=0` - *Quantidade de senhas memorizadas*
  * `samba-tool domain passwordsettings set --min-pwd-age=0` - *Tempo mínimo para renovação de senha*
  * `samba-tool domain passwordsettings set --max-pwd-age=0` - *Tempo máximo para renovação de senha*
  * `samba-tool domain passwordsettings set --min-pwd-length=4` - *Tamanho mínimo de senha aceitável*

* Comandos uteis
  * `sudo /etc/init.d/samba/ start` - *Inicia serviço do Samba*
  * `sudo /etc/init.d/samba/ restart`  - *Reinicia serviço do Samba*
  * `sudo /etc/init.d/samba/ stop` - *Interrompe serviço do Samba*
  * `sudo systemctl start samba-ad-dc.service` - *Inicia serviço do Samba*
  * `sudo systemctl restart samba-ad-dc.service` - *Reinicia serviço do Samba*
  * `sudo systemctl stop samba-ad-dc.service` - *Interrompe serviço do Samba*
  * `smbstatus` - *Retorna informações de login de usuários no domínio*
  * `testparm` - *Verifica se há erros no arquivo smb.conf*
  * `wbinfo -g` - *Lista grupos usando ferramenta wimbindd*
  * `wbinfo -u` - *Lista usuários usando ferramenta wimbindd*
  * `wbinfo -i meusuario` - *Consulta informação de login de usuario usando ferramenta wimbindd*
  * `getent passwd | grep MEUDOMINIO` - *Lista usuários consultando diretamente arquivos*
  * `getent group | grep MEUDOMINIO` - *Lista grupos consultando diretamente arquivos*

* Conceder poderes root a usuário Samba-AD-DC
  * usermod -aG sudo 'DOMAIN\your_domain_user' - Coloca usuado samba ao grupo sudo e dá privilegios root no sistema local
  * Para dar privilégios root a todos os usuario de um grupo adicione a linha ao arquivo apos a linha privilegios de root
    * sudo mcedit /etc/sudoers
     ~~~
     %TESTE\\domain\ meugrupo ALL=(ALL:ALL) ALL
     ~~~
~~~
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
