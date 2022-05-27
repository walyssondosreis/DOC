# SAMBA 4 Active Directory Domain Controller  
## Manipulação e Gerenciamento de Terminais

### Configuração de Terminais
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

* Intalação de ferramenta RSAT no host Windows administrador:
  * O conjunto de ferramentas RSAT serve para gerenciar o servidor AD remotamente através de uma máquina Windows 
  * Baixa a ferramenta RSAT de acordo com sistema operacional Windows a ser intalado:
    * [RSAT Windows 7 x64](https://thesystemcenterblog.files.wordpress.com/2021/02/9ec67-rsat-tools-for-windows-7-64-bit.zip)
  * Ative as opções de recurso de gerenciamento para o host conforme a imagem abaixo:    
  ![image](https://user-images.githubusercontent.com/38730743/137502630-cf2cb84a-7bba-4d04-aeb9-da579f1605de.png)

### Gerenciamento RSAT Active Directory 
* Sobre as ferramentas: 
    * As ferramantas de gerenciamento de servidor pode ser encontradas em:
    * Painel de Controle > Ferramentas Administrativas
  * Ferramentas mais utilizadas:
    * Gerenciamento de Diretiva de Grupo
    * Gerenciamento de Impressão
    * Gerenciamento do Computador
    * Usuários e Computadores do Active Directory
* Criação de diretiva de grupo (GPO):
  * GPO para Roaming Profile:
    * Esta GPO será utilizada para configurar o perfil dos usuários como remoto (no servidor)
    * Gerenciamento de Diretiva de Grupo > "Clique com botão direito do mouse no nome do domínio" > Criar GPO
    *  "Clique com botão direito do mouse na GPO criada" > Editar: Editor de Gerenciamento de Diretiva de Grupo
    *  Navegue até o arquivo conforme abaixo: 
    ![image](https://user-images.githubusercontent.com/38730743/137502541-ed5af11d-3d33-4b61-a45f-edc888b7d67a.png)
    * Habilite e insira como caminho de perfil: \\\srv.meudominio.lan\profiles\\%USERNAME%  
    * No CMD o comando: `gpupdate /force` - Força a aplicação/atualização das GPOs
   
  * GPO para Definição de Wallpaper:
    * Esta GPO será utilizada para configurar o papel de parede dos usuários
    * Gerenciamento de Diretiva de Grupo > "Clique com botão direito do mouse no nome do domínio" > Criar GPO
    *  "Clique com botão direito do mouse na GPO criada" > Editar: Editor de Gerenciamento de Diretiva de Grupo
    *  Navegue até o arquivo conforme abaixo: 
    ![wallpaper](https://user-images.githubusercontent.com/38730743/137504908-a06d1fcd-27d8-41b7-a894-e18eb8b0cb7a.png)
    * Habilite e insira em nome do papel de parede como: \\\srv.meudominio.lan\sysvol\\meudominio.lan\imgem01.bmp
    * OBS: O Windows trabalha melhor com papeis de parede no forma Bitmap (.bmp)
    * No CMD o comando: `gpupdate /force` - Força a aplicação/atualização das GPOs
 
  * GPO para Mapeamento de Pastas:
    * Esta GPO será utilizada para mapeamento de pastas compartilhadas
    * Gerenciamento de Diretiva de Grupo > "Clique com botão direito do mouse no nome do domínio" > Criar GPO
    *  "Clique com botão direito do mouse na GPO criada" > Editar: Editor de Gerenciamento de Diretiva de Grupo
    *  Navegue até o arquivo conforme abaixo: 
    ![map](https://user-images.githubusercontent.com/38730743/137506498-e93451dc-daed-49a5-b8c6-425eb620e2a4.png)
    *  "Clique com botão direito do mouse em Mapas de Unidade" > Novo > Unidade Mapeada
    *  Em "Local" insira o caminho da pasta compartilhada: \\\srv.meudominio.lan\minhapastacomp 
    *  No CMD o comando: `gpupdate /force` - Força a aplicação/atualização das GPOs
-----
## Referências:
https://mundodacomputacaointegral.blogspot.com/2020/01/ingressando-maquina-linux-no-dominio-ad.html   
http://www.bosontreinamentos.com.br/linux/samba-4-adicionando-um-host-windows-ao-dominio-e-administracao-remota/   
https://www.profissionaisti.com.br/active-directory-ad-inserir-um-papel-de-parede-via-gpo/#:~:text=Navegue%20em%20Configura%C3%A7%C3%B5es%20de%20Usu%C3%A1rio,de%20trabalho%2C%20conforme%20figura%20abaixo  
https://techexpert.tips/pt-br/windows-pt-br/gpo-aplicar-a-um-usuario-ou-grupo-especifico/  
https://www.tecmint.com/create-shared-directory-on-samba-ad-dc-and-map-to-windows-linux/  
https://www.golinuxhub.com/2012/08/create-roaming-profiles-in-samba4/  
https://superuser.com/questions/161759/where-do-i-find-the-internet-time-ntp-settings-in-windows-7  
https://techexpert.tips/pt-br/windows-pt-br/gpo-configurar-servidor-ntp/   
https://docs.microsoft.com/en-us/answers/questions/139419/rsat-tool-for-windows-7-download.html  
http://www.andreruschel.com/2018/08/mapeando-unidade-de-rede-usando-gpo-no.html  
