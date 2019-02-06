set LOCAL=%~dp0
set INSTALL=D:\install
set PATH=%INSTALL%\gnat-community-2018-x86_64-windows\bin;%PATH%
set PATH=%INSTALL%\gnat-community-2018-arm-elf-windows64\bin;%PATH%
set PATH=%LOCAL%\libs;%PATH%
set ADA_PROJECT_PATH=%LOCAL%\game_support;%LOCAL%\gnat_sdl;
set LIBRARY_PATH=%LOCAL%\libs;%LIBRARY_PATH%
set GPS_HOME=%LOCAL%
set HOST=Windows
@echo off
echo -
echo -
echo ********************************
echo **                            **
echo ** 64 bits environment ready  **
echo **                            **
echo ********************************
echo - 
echo -  run gps from this console
echo - 
echo -
cmd
