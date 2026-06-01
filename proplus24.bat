@echo off
set tmp_fold=office-%random%
md %tmp_fold%
cd %tmp_fold%
curl -O https://tools.ccccloud.com/ISO/Microsoft_Office/2024/ProPlus/proPlus2024.rar
curl -LkO https://github.com/cccaaron/365/raw/refs/heads/main/UnRAR.exe
UnRAR e proPlus2024.rar
setup.exe /configure Configuration-office2024-proplus.xml
cd/d "C:\Program Files\Microsoft Office\Office16"
cscript ospp.vbs /inpkey:Y2W8T-NGB83-FGRDP-22R9R-W8J83
cscript ospp.vbs /act
cd/d "%~dp0"
rd/q /s %tmp_fold%
exit


