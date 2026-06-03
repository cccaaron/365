@echo off
net session >nul 2>&1
if "%~1%errorlevel%" neq "10" (
echo CreateObject^("Shell.Application"^).ShellExecute "%~f0", "1", "", "runas", 0 > "%tmp%\b.vbs"
echo CreateObject^("Scripting.FileSystemObject"^).DeleteFile WScript.ScriptFullName >> "%tmp%\b.vbs"
start wscript.exe "%tmp%\b.vbs"&exit)
cd/d "%userprofile%\Downloads"
set tmp_fold=office-%random%
md %tmp_fold%
cd %tmp_fold%
curl -kO https://raw.githubusercontent.com/cccaaron/365/refs/heads/main/proplus24/setup.exe
curl -kO https://raw.githubusercontent.com/cccaaron/365/refs/heads/main/proplus24/Configuration.xml
setup.exe /configure Configuration.xml
cd ..
rd/q /s %tmp_fold%
del/q "%~f0"&exit
