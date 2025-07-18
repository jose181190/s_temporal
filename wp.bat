@echo off
set "RAW_FILE_URL=https://raw.githubusercontent.com/tu-usuario/tu-repo/main/ruta/al/tu/archivo.txt"
set "DESTINATION_PATH=C:\Ruta\Exacta\Destino\nombre_archivo.txt"

echo Descargando el archivo de GitHub...

REM Intenta con PowerShell si esta disponible (mas robusto)
powershell -Command "Invoke-WebRequest -Uri '%RAW_FILE_URL%' -OutFile '%DESTINATION_PATH%'"

REM Si PowerShell falla o no esta disponible, intenta con curl (Windows 10+)
if %errorlevel% neq 0 (
    echo PowerShell no disponible o fallo, intentando con curl...
    curl -o "%DESTINATION_PATH%" "%RAW_FILE_URL%"
)

if exist "%DESTINATION_PATH%" (
    echo Archivo descargado exitosamente a: %DESTINATION_PATH%
) else (
    echo Error: No se pudo descargar el archivo.
    echo Asegurate de que la URL "Raw" sea correcta y tengas conexion a internet.
)

pause
exit