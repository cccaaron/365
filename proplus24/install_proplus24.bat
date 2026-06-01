@echo off
net session >nul 2>&1||(powershell start-process ""%0"" -Verb RunAs&exit)
cd/d "%userprofile%\Downloads"
set tmp_fold=office-%random%
md %tmp_fold%
cd %tmp_fold%
curl -kO https://raw.githubusercontent.com/cccaaron/365/refs/heads/main/proplus24/setup.exe
curl -kO https://raw.githubusercontent.com/cccaaron/365/refs/heads/main/proplus24/Configuration.xml
setup.exe /configure Configuration.xml
cd/d "%~dp0"
rd/q /s %tmp_fold%
del/q "%~f0"
exit/b
