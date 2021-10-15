# SAMBA 4 Active Directory Domain Controller  
## Configuração de Terminais
### Windows
* Antes de ingressar no domínio defina no host como DNS primário o endereço do servidor Samba-AD-DC: 192.168.0.1

### Linux
* `sudo add-apt-repository ppa:emoraes25/cid`
* `sudo apt update`
* `sudo apt install cid cid-gtk`
* `sudo cid-gtk`
* `sudo cid status`
* `sudo service cid status`

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
