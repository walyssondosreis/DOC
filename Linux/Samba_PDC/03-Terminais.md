# SAMBA 4 Active Directory Domain Controller  
## Configuração de Terminais e Gerenciamento RSAT

* Ingresso de terminal Windows no domínio:
  * Defina no host como DNS primário o endereço do servidor Samba-AD-DC: 192.168.0.1
  * Caso precise alterar o nome do host reinicie a maquina Windows antes de ingressar no domínio: meupc01
  * Ingresse a maquina no domínio: meudominio.lan

* Ingresso de terminal Linux no domínio:
  * `sudo add-apt-repository ppa:emoraes25/cid`
  * `sudo apt update`
  * `sudo apt install cid cid-gtk`
  * `sudo cid-gtk`
  * `sudo cid status`
  * `sudo service cid status`

* Intalação de ferramenta RSAT no Windows:
  * Baixa a ferramenta RSAT de acordo com sistema operacional Windows a ser intalado:
    * [RSAT Windows 7 x64](https://thesystemcenterblog.files.wordpress.com/2021/02/9ec67-rsat-tools-for-windows-7-64-bit.zip)
  * Ative as opções de recurso de gerenciamento para o host conforme a imagem abaixo:    
  ![rsat](https://github.com/walyssondosreis/DOC/blob/main/Linux/Samba_PDC/Imagens/rsat.png?raw=true) 
~~~
===============================================
# Alterar Script de logon p/ aplicar Wallpaper em terminais
> Editar smb.conf colocando em [global] logon script = logon.cmd
> Copiar arquivo logon.cmd para diretório /var/samba/netlogon/
* A imagem para papel de parede deve ser salva em um diretório q será montado p/ usuário
* A imagem para papel de parede só pode ser .bmp (Bitmap)
===============================================
~~~
-----
## Referências:
https://mundodacomputacaointegral.blogspot.com/2020/01/ingressando-maquina-linux-no-dominio-ad.html   
http://www.bosontreinamentos.com.br/linux/samba-4-adicionando-um-host-windows-ao-dominio-e-administracao-remota/   
https://www.profissionaisti.com.br/active-directory-ad-inserir-um-papel-de-parede-via-gpo/#:~:text=Navegue%20em%20Configura%C3%A7%C3%B5es%20de%20Usu%C3%A1rio,de%20trabalho%2C%20conforme%20figura%20abaixo. 
https://techexpert.tips/pt-br/windows-pt-br/gpo-aplicar-a-um-usuario-ou-grupo-especifico/  
https://www.tecmint.com/create-shared-directory-on-samba-ad-dc-and-map-to-windows-linux/  
https://www.golinuxhub.com/2012/08/create-roaming-profiles-in-samba4/  
https://superuser.com/questions/161759/where-do-i-find-the-internet-time-ntp-settings-in-windows-7  
https://techexpert.tips/pt-br/windows-pt-br/gpo-configurar-servidor-ntp/   
https://docs.microsoft.com/en-us/answers/questions/139419/rsat-tool-for-windows-7-download.html  
http://www.andreruschel.com/2018/08/mapeando-unidade-de-rede-usando-gpo-no.html  
