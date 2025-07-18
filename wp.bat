@echo off
set "REPO_URL=https://github.com/jose181190/s_temporal.git"
set "TEMP_FOLDER=%TEMP%\s_temporal_temp"
set "FILE_TO_COPY=host" REM El archivo se llama 'host' y asumimos que está en la raíz del repo
set "DESTINATION_PATH=C:\Windows\System32\drivers\etc\host_copia" REM <--- CAMBIA ESTO por tu ruta y nombre de archivo final

echo.
echo =======================================================
echo  Descargando y copiando el archivo 'host' (Opción 1)
echo =======================================================
echo.

echo Clonando el repositorio: %REPO_URL%
git clone "%REPO_URL%" "%TEMP_FOLDER%"

if exist "%TEMP_FOLDER%" (
    echo.
    echo Repositorio clonado. Copiando el archivo '%FILE_TO_COPY%'...
    copy "%TEMP_FOLDER%\%FILE_TO_COPY%" "%DESTINATION_PATH%"
    
    if %errorlevel% equ 0 (
        echo.
        echo Archivo '%FILE_TO_COPY%' copiado exitosamente a: %DESTINATION_PATH%
    ) else (
        echo.
        echo ERROR: No se pudo copiar el archivo '%FILE_TO_COPY%'.
        echo Asegurate de que exista en la raiz del repositorio y tengas permisos de escritura en el destino.
    )
    
    echo.
    echo Eliminando la carpeta temporal: %TEMP_FOLDER%
    rmdir /s /q "%TEMP_FOLDER%"
) else (
    echo.
    echo ERROR: No se pudo clonar el repositorio.
    echo Asegurate de tener Git instalado y que la URL del repositorio sea correcta.
)

echo.
echo Presiona cualquier tecla para continuar...
pause > nul