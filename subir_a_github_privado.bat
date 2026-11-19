@echo off
chcp 65001 > nul
title Subir Portafolio a GitHub Privado - NFS TECH
cls
echo ====================================================================
echo   ⚡ HECTOR BRITO - NFS TECH | SUBIR A GITHUB (REPOSITORIO PRIVADO)
echo ====================================================================
echo.

set "PATH=C:\Users\usuario\AppData\Local\Programs\Git\cmd;C:\Program Files\GitHub CLI;%PATH%"

echo [1/3] Verificando inicio de sesión en GitHub...
gh auth status > nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo >> No hay sesión iniciada de GitHub todavía.
    echo >> Se abrirá GitHub en tu navegador para autorizar con un código en 1 clic.
    echo.
    echo Presiona cualquier tecla para conectar con GitHub...
    pause > nul
    gh auth login --web -h github.com -p https
)

echo.
echo [2/3] Creando repositorio PRIVADO en tu cuenta de GitHub...
set /p REPO_NAME="Escribe el nombre del repositorio [Por defecto: portafolio-nfs-tech]: "
if "%REPO_NAME%"=="" set "REPO_NAME=portafolio-nfs-tech"

gh repo create "%REPO_NAME%" --private --source="." --remote=origin --push

if %errorlevel% equ 0 (
    echo.
    echo ====================================================================
    echo   ✅ ¡ÉXITO! Tu portafolio ahora es un REPOSITORIO PRIVADO en GitHub.
    echo   Visítalo en tu cuenta: https://github.com
    echo ====================================================================
) else (
    echo.
    echo Intentando sincronizar directamente con git push...
    git push -u origin main
)

echo.
pause
