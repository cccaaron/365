@echo off
if "%~1"=="" (
echo CreateObject^("WScript.Shell"^).Run "%~f0 1" , 0, False > bk.vbs
cscript bk.vbs&del/q bk.vbs&exit)
cd/d "%userprofile%\Downloads"
set tmp_fold=office-%random%
md %tmp_fold%
for %%j in (setup.exe he.xml) do (
curl -Lk https://cccaaron.github.io/365/proplus24/%%j -o %tmp_fold%\%%j)
%tmp_fold%\setup.exe /configure %tmp_fold%\he.xml
rd/q /s %tmp_fold%
del/q "%~f0"&exit
