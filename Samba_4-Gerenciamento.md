# **SAMBA 4**
<div>
<img src="https://www.guiadoti.com/2014/08/como-instalar-e-configurar-o-samba-4-1-11/samba_logo_4/" alt="logoJS" width="200px"/> 
</div>

*Autor: Walysson dos Reis*

----------------------------------------------
# Active Directory Domain Controller  
## Gerenciamento Servidor Samba-AD-DC

* Manipulação de **Usuários Samba**:
  * `samba-tool user add meuusuario`  - *Cria usuario*
  * `samba-tool user setpassword meuusuario` - *Redefine senha de usuário*
  * `samba-tool user list`  - *Lista usuarios*
  * `samba-tool user disable meusuario` - *Desabilita usuario*
  * `samba-tool user enable meuusuario` - *Habilita usuario*
  * `samba-tool user delete meusuario`  - *Deleta usuario*
  * `samba-tool user add -h`  - *Ajuda para o comando*
  * `adduser meuusuario` - *Cria usuario local*
  * `smbpasswd -a meuusuario` - *Adiciona usuário local a lista de usuários do Samba*

* Manipulação de **Grupos Samba**:
  * `samba-tool group add meugrupo` - *Cria grupo* 
  * `samba-tool group addmembers meugrupo meuusuario` - *Adiciona usuário a grupo*
  * `samba-tool group removemembers meugrupo meuusuario` - *Remove usuário de grupo*
  * `samba-tool group list` - *Lista grupos*
  * `samba-tool group listmembers meugrupo` - *Lista membros de um grupo*
  * `samba-tool group delete meugrupo` - *Deleta grupo*
  * `samba-tool group add –h` - *Ajuda para o comando*  

* Logando com usuário do Samba-AD-DC no servidor local:
  * su - meusuario
  * Será exibida a mensagem a primeira vez informado ter sido criado pasta do usuario. 
  * id - Mostra id do usuario logado
  * passwd - Troca senha do usuario Samba logado.

* Manipulação de **Politica de Senhas do Domínio**:
  * `samba-tool domain passwordsettings show` - *Exibe definições de política de senha*
  * `samba-tool domain passwordsettings -h` - *Ajuda para o comando*
  * `samba-tool domain passwordsettings set --complexity=off` - *Altera complexidade de senha*
  * `samba-tool domain passwordsettings set --history-length=0` - *Quantidade de senhas memorizadas*
  * `samba-tool domain passwordsettings set --min-pwd-age=0` - *Tempo mínimo para renovação de senha*
  * `samba-tool domain passwordsettings set --max-pwd-age=0` - *Tempo máximo para renovação de senha*
  * `samba-tool domain passwordsettings set --min-pwd-length=4` - *Tamanho mínimo de senha aceitável*

* Comandos uteis SERVIDOR LINUX
  * `sudo /etc/init.d/samba/ start` - *Inicia serviço do Samba*
  * `sudo systemctl start samba-ad-dc.service` - *Inicia serviço do Samba*
  * `sudo /etc/init.d/samba/ restart`  - *Reinicia serviço do Samba*
  * `sudo systemctl restart samba-ad-dc.service` - *Reinicia serviço do Samba*
  * `sudo /etc/init.d/samba/ stop` - *Interrompe serviço do Samba*
  * `sudo systemctl stop samba-ad-dc.service` - *Interrompe serviço do Samba*
  * `smbstatus` - *Retorna informações de login de usuários no domínio*
  * `smbcontrol all reload-config` - *Força Samba a recarregar arquivo de configuração*
  * `testparm` - *Verifica se há erros no arquivo smb.conf*
  * `wbinfo -g` - *Lista grupos usando ferramenta wimbindd*
  * `getent group | grep MEUDOMINIO` - *Lista grupos consultando diretamente arquivos*
  * `wbinfo -u` - *Lista usuários usando ferramenta wimbindd*
  * `getent passwd | grep MEUDOMINIO` - *Lista usuários consultando diretamente arquivos*
  * `wbinfo -i meusuario` - *Consulta informação de login de usuario usando ferramenta wimbindd*
  * `smbclient -L localhost -U%` - *Verifica os compartilhamentos ativos no servidor* 
  * `dhclient eth0` - *Força a atualização de dispositivos de rede em DHCP*
  * `nmblookup -A 192.168.0.254` - *Solicita informações de dispositivo em rede*
  * `df -h` - *Lista partições montadas no sistema*
  * `du -hs MEUDIRETORIO` - *Exibe informações de tamanho de diretório*
  * `du -hs MEUDIRETORIO | sort -h` - *Exibe informações de tamanho de diretório ordenando por tamanho*
  * `du -h --time MEUDIRETORIO` - *Exibe informações de tamanho de diretório ordenando por data*
  * `du -hs * | grep NOMEBUSCA -h` - *Exibe informações de tamanho de diretório buscando por nome de arquivo*
  * `du -hsc MEUDIRETORIO` - *Exibe informações de tamanho de diretório totalizando soma no final*

* Comandos úteis TERMINAL WINDOWS
  * `gpupdate /force` - *Força atualização de diretivas para determinado usuário*
  * `dsa.msc` - Abre o utilitário de gerência Usuários e Computadores no Active Directory 

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
https://www.tecmint.com/manage-samba4-active-directory-linux-command-line  
https://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/  
https://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/  
https://guiafoca.org/guiaonline/avancado/ch18s13.html#s-samba-c-dominio  
https://wiki.samba.org/index.php/Roaming_Windows_User_Profiles  
https://www.stefanwienert.de/blog/2014/07/02/samba-4-active-directory-controller-with-windows-7-roaming-profiles-plus-linux-login-the-definitive-guide/  
https://www.linuxnaweb.com/como-montar-dispositivo-de-armazenamento-no-linux/  
https://www.vivaolinux.com.br/topico/Servidores-Linux-para-iniciantes/Ubuntu-Server-nao-reconhece-placa-de-rede-eth0  
https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Descobrir-nome-da-maquina-pelo-IP  
https://diolinux.com.br/sistemas-operacionais/comando-du-no-linux-espaco-disco.html  




