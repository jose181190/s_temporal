@echo off
REM URL "Raw" del archivo 'hosts' en tu repositorio 's_temporal'
set "RAW_FILE_URL=https://raw.githubusercontent.com/jose181190/s_temporal/main/hosts" 
REM Si el archivo 'hosts' estuviera en una subcarpeta (ej. 'mis_archivos/hosts'), la URL sería:
REM set "RAW_FILE_URL=https://raw.githubusercontent.com/jose181190/s_temporal/main/mis_archivos/hosts"

set "DESTINATION_PATH=C:\Windows\System32\drivers\etc\hosts" REM Tu ruta definitiva en el escritorio, con el mismo nombre

echo.
echo ========================================================
echo  ..
echo ========================================================
echo.

#echo Iniciando %RAW_FILE_URL%
#echo r: %DESTINATION_PATH%
echo.

REM Intenta con PowerShell (mas robusto)
powershell -Command "Invoke-WebRequest -Uri '%RAW_FILE_URL%' -OutFile '%DESTINATION_PATH%'"

REM Si PowerShell falla o no esta disponible, intenta con curl (Windows 10+)
if %errorlevel% neq 0 (
    echo PowerShell no disponible o fallo, intentando con curl...
    curl -o "%DESTINATION_PATH%" "%RAW_FILE_URL%"
)

if exist "%DESTINATION_PATH%" (
    echo.
    echo Archivo 'hosts' descargado exitosamente a: %DESTINATION_PATH%
) else (
    echo.
    echo ERROR: No se pudo descargar el archivo 'hosts'.
    echo Asegurate de que la URL "Raw" sea correcta, el archivo exista en GitHub y tengas conexion a internet.
)

shutdown -r

exit