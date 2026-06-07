@echo off
if "%~1"=="" (
echo CreateObject^("WScript.Shell"^).Run "%~f0" , 0, False > "%tmp%\bk.vbs"
start cscript.exe "%tmp%\bk.vbs"&exit)
del/q "%tmp%\bk.vbs"
cd/d "%userprofile%\Downloads"
set tmp_fold=office-%random%
md %tmp_fold%
cd %tmp_fold%
curl -kO https://raw.githubusercontent.com/cccaaron/365/refs/heads/main/proplus24/setup.exe
curl -kO https://raw.githubusercontent.com/cccaaron/365/refs/heads/main/proplus24/Configuration.xml
cd ..
%tmp_fold%\setup.exe /configure %tmp_fold%\Configuration.xml
rd/q /s %tmp_fold%
del/q "%~f0"&exit
