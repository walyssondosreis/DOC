# **FAKE PRO**
*Autor: Walysson dos Reis  
Data Início: 01/10/2021*  

---


## Softwares 

* Linux Mint 20.3 Una : Kernel 5.4.0-100-generic
* ffmpeg 7:4.2.4-1ubuntu0.1
* Pulse Audio Virtual Sink
* v4l2loopback-dkms 0.12.3-1ubuntu0.4
* OBS Studio 27.2.1-0obsproject1~focal
* Android Studio Bumblebee | 2021.1.1 Patch 2

## Instalação
* `sudo apt-get install ffmpeg`  
* `sudo xed /etc/pulse/default.pa` // Adicione ao final do arquivo:
~~~
load-module module-null-sink sink_name=Virtual_Sink sink_properties=device.description=Virtual_Sink
~~~
* `pacmd load-module module-null-sink sink_name=Virtual_Sink sink_properties=device.description=Virtual_Sink`
* `sudo modprobe snd_aloop`
* `sudo apt install v4l2loopback-dkms`
* `sudo add-apt-repository ppa:obsproject/obs-studio`
* `sudo apt update`
* `sudo apt install obs-studio`

## Opcional

* `sudo xed ~/.bashrc` // Coloca Android SDK no path Ubuntu. Abra o arquivo 'bashrc' e adicione ao final:
~~~~
export PATH=$PATH:/home/USUARIO/android-studio/bin
export ANDROID_SDK_HOME="~/Android/Sdk"
alias emulator="$ANDROID_SDK_HOME/emulator/emulator"
~~~~
* `ls -ltrh /dev/video*` // Lista dispositivos de camêras conectados ao sistema
* `ls -l /dev/video*` // Lista dispositivos de camêras conectados ao sistema
* `v4l2-ctl --list-devices` // Lista ID do dispositivo de câmera virtual
* `ffmpeg -f x11grab -r 15 -s 1366x768 -i :0.0+0,0 -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0` // Inicia camêra virtual pelo terminal capturando monitor
* `ffmpeg -re -i input.mp4 -map 0:v -f v4l2 /dev/video0` // Inicia câmera virtual pelo terminal passando vídeo a ser reproduzido
---- 
![image](https://user-images.githubusercontent.com/38730743/156210953-ab4e2160-8f0c-4456-9412-5db01fb19470.png)
![2022-03-01_16-22](https://user-images.githubusercontent.com/38730743/157657345-73046fda-49f2-4568-b1bf-9aad030e61a8.png)
![2022-03-01_17-10](https://user-images.githubusercontent.com/38730743/157657350-f283d3b9-54a4-4356-9c2a-22f8aaee10c7.png)
![2022-03-01_17-15](https://user-images.githubusercontent.com/38730743/157657355-90b0662a-e5f3-4104-857a-3c9cbb041de5.png)
![2022-03-01_18-04](https://user-images.githubusercontent.com/38730743/157657372-63e9379d-f23d-4ded-9b88-10248c8316eb.png)


--------
## Referências
https://obsproject.com/wiki/install-instructions#linux  
https://askubuntu.com/questions/881305/is-there-any-way-ffmpeg-send-video-to-dev-video0-on-ubuntu  
https://superuser.com/questions/411897/using-desktop-as-fake-webcam-on-linux  
https://stackoverflow.com/questions/14012924/android-how-to-use-webcam-in-emulator  
https://www.onetransistor.eu/2017/10/virtual-audio-cable-in-linux-ubuntu.html  
https://stackoverflow.com/questions/37300811/android-studio-dev-kvm-device-permission-denied  
https://cursos.alura.com.br/forum/topico-adicionar-e-remover-caminhos-do-path-46966  
https://stackoverflow.com/questions/11779490/how-to-add-a-new-audio-not-mixing-into-a-video-using-ffmpeg  
https://www.techtudo.com.br/dicas-e-tutoriais/noticia/2017/04/como-rodar-apps-android-no-ubuntu-sem-emulacao.html  
https://www.onetransistor.eu/2017/10/virtual-audio-cable-in-linux-ubuntu.html  
https://www.youtube.com/watch?v=Eca509IDLdM  
https://www.youtube.com/watch?v=QQ3bzXeuo5I  

