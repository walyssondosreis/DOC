# **LINUX**
<div>
<img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/54bd1b08-ae69-4d4c-97c2-0c08d9a56554/d5k4ghu-0391d69d-0c66-4233-a4f9-3e2fa666f789.png/v1/fill/w_256,h_256,strp/simple_linux_logo_by_dablim_d5k4ghu-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjU2IiwicGF0aCI6IlwvZlwvNTRiZDFiMDgtYWU2OS00ZDRjLTk3YzItMGMwOGQ5YTU2NTU0XC9kNWs0Z2h1LTAzOTFkNjlkLTBjNjYtNDIzMy1hNGY5LTNlMmZhNjY2Zjc4OS5wbmciLCJ3aWR0aCI6Ijw9MjU2In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.hR1HqwHmZ7YRuntimaklPyEcHDi8TdiD5OdE5edc1Ic" alt="logoJS" width="50px"/> 
</div>

*Autor: Walysson dos Reis*

----------------------------------------------
*Manual de consulta rápida dos conceitos e principais comandos.*  

---------------------
~~~

Aplicativos:
-----------------------------
Duplicati
FreeFileSync
Visual Studio Code
qBittorrent
KeePassXC
GParted
Flameshot
DB Browser for SQLite
Ajustes do Gnome (Tweak)
Brave Web Browser
Dropbox
Pencil
Gimp
Git
Veracrypt
Calibre
nomacs
VLC
p7zip
Engrapa

-----------------------------
Ver lista de processos 
pid

matar processo
kill -9 Id_PID

-------------
Instalar pacote DEB via linha de comando
sudo dpkg -i pacote.deb 
sudo dpkg --configire -a && sudo apt-get install -f
-------------
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install boot-repair

sudo add-apt-repository ppa:yannubuntu/boot-repair -r -y
sudo apt-get remove boot-repair --auto-remove
-----------
GRUB 2 - ALTERANDO ORDEM DE BOOT


Mudando a ordem de boot no Ubuntu (ou similares) com GRUB 2:

1. Verifique no prompt do boot, qual a ordem do S.O. que você quer.

Por exemplo: a primeira linha no prompt tem a ordem zero, a segunda 1 e assim por diante. Suponha que o S.O. selecionado esteja na ordem 5 (cinco).

2. Abra o arquivo, em /etc/default/grub:

$ sudo gedit /etc/default/grub

3. Procure a linha:
GRUB_DEFAULT=0
E mude para:

GRUB_DEFAULT=5

Salve e feche o arquivo.

4. Depois, rode o comando:

 sudo update-grub


No próximo boot, a quinta linha do prompt será executada por padrão, abrindo o S.O. selecionado.
-------------------
Consertar Hora Dual boot Linux Windows
timedatectl set-local-rtc 1 --adjust-system-clock
--------------------
Reconfigurar teclado
sudo dpkg-reconfigure keyboard-configuration
~~~
--------
## Referências  

https://www.vivaolinux.com.br/topico/vivaolinux/Configurar-Teclado-para-ABNT2-Ubuntu-1404  
https://ubuntuhandbook.org/index.php/2016/05/time-differences-ubuntu-1604-windows-10/  
https://www.vivaolinux.com.br/dica/GRUB-2-Alterando-ordem-de-boot  
https://www.youtube.com/watch?v=Xg_Qy0fdY6c  
https://www.vivaolinux.com.br/topico/Elementary-OS-1/Nao-consigo-instalar-pacotes-deb-na-distrohttps://plus.diolinux.com.br/t/usando-o-dark-mode-no-elementary-os-5-0/133  
https://canaltech.com.br/linux/conheca-6-comandos-para-gerenciar-processos-do-linux/  
https://www.vivaolinux.com.br/dica/Montando-particoes-automaticamente-no-Linux-Mint  



