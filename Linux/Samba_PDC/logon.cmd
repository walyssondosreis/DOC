@echo off
echo.
echo.
echo #############################################
echo # Script de Inicializacao
echo #############################################
echo.
echo.

call :quiet>nul 2>&1
goto :EOF
:quiet

net time \\srvPDC /set /yes

@net use P: /del
@net use P: \\srvPDC\publico

:: Configure Wallpaper
xcopy "\\srvPDC\publico\Wallpaper\vox004.bmp" "%USERPROFILE%" /C/Y/D
REG ADD "HKCU\Control Panel\Desktop" /V Wallpaper /T REG_SZ /F /D "%USERPROFILE%\vox004.bmp"
REG ADD "HKCU\Control Panel\Desktop" /V WallpaperStyle /T REG_SZ /F /D 2
REG ADD "HKCU\Control Panel\Desktop" /V TileWallpaper /T REG_SZ /F /D 0
:: Para as alteracoes entrarem em vigor imediatamente
%SystemRoot%\System32\RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters

exit

