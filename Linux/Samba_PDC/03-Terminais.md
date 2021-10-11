# SAMBA 4 Active Directory Domain Controller  
## Configuração de Terminais
### Windows
* Antes de ingressar o host ao domínio certifique-se do nome host já estar adicionado no servidor.
* Crie e execute o arquivo de registro (win.reg) no terminal Windows:
  ~~~
  Windows Registry Editor Version 5.00
  [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\LanmanWorkstation\Parameters]
  "DomainCompatibilityMode"=dword:00000001
  "DNSNameResolutionRequired"=dword:00000000
  [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths]
  "\\\\*\\netlogon"="RequireMutualAuthentication=0,RequireIntegrity=0,RequirePrivacy=0"  
  ~~~
* No terminal Windows desabilite o perfil temporário:
  * Executar : gpedit.msc> Configuração do computador > Modelos administrativos >   
    Sistema > Perfis de usuário > "Não Conectar usuários com perfis temporários" : **Habilitar**

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

