cd .\Executables
python-3.9.7-amd64.exe /quiet InstallAllUsers=1
start NSudoLC.exe -U:S -P:E -M:S -Priority:RealTime -Wait SECUI.bat
@powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage -all *Microsoft.Windows.SecHealthUI* | Remove-AppPackage -AllUsers"