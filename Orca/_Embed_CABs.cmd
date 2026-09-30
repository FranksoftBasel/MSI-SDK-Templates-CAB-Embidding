@echo off
setlocal

set "MSI=C:\Users\Admin\Documents\Orca-x86_en-us.msi"
set "SCRIPTDIR=D:\Temp\PKG_Needs\SDK\scripts"

set "CAB1=C:\Users\Admin\Documents\838060235bcd28bf40ef7532c50ee032.cab"
set "CAB2=C:\Users\Admin\Documents\a35cd6c9233b6ba3da66eecaa9190436.cab"
set "CAB3=C:\Users\Admin\Documents\fe38b2fd0d440e3c6740b626f51a22fc.cab"

echo.
echo ==========================================
echo Embed CAB files into MSI
echo ==========================================
echo.

cscript //nologo "%SCRIPTDIR%\WiStream.vbs" "%MSI%" "%CAB1%"
if errorlevel 1 goto :error

cscript //nologo "%SCRIPTDIR%\WiStream.vbs" "%MSI%" "%CAB2%"
if errorlevel 1 goto :error

cscript //nologo "%SCRIPTDIR%\WiStream.vbs" "%MSI%" "%CAB3%"
if errorlevel 1 goto :error

echo.
echo Updating Media table...
echo.

cscript //nologo "%SCRIPTDIR%\WiRunSQL.vbs" "%MSI%" "UPDATE Media SET Cabinet='#838060235bcd28bf40ef7532c50ee032.cab' WHERE Cabinet='838060235bcd28bf40ef7532c50ee032.cab'"
if errorlevel 1 goto :error

cscript //nologo "%SCRIPTDIR%\WiRunSQL.vbs" "%MSI%" "UPDATE Media SET Cabinet='#a35cd6c9233b6ba3da66eecaa9190436.cab' WHERE Cabinet='a35cd6c9233b6ba3da66eecaa9190436.cab'"
if errorlevel 1 goto :error

cscript //nologo "%SCRIPTDIR%\WiRunSQL.vbs" "%MSI%" "UPDATE Media SET Cabinet='#fe38b2fd0d440e3c6740b626f51a22fc.cab' WHERE Cabinet='fe38b2fd0d440e3c6740b626f51a22fc.cab'"
if errorlevel 1 goto :error

echo.
echo ==========================================
echo Done
echo CAB files are now embedded in the MSI.
echo ==========================================
echo.

cscript //nologo "%SCRIPTDIR%\WiStream.vbs" "%MSI%"

goto :eof

:error
echo.
echo ERROR - operation failed.
pause
exit /b 1