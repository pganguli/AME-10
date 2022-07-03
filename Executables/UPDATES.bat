DISM.exe /Online /Remove-Package /PackageName:Package_for_RollupFix~31bf3856ad364e35~amd64~~19041.1645.1.11 /quiet /norestart
DISM.exe /Online /Remove-Package /PackageName:Package_for_RollupFix~31bf3856ad364e35~amd64~~19041.1586.1.7 /quiet /norestart
sc config wuauserv start= disabled
sc stop wuauserv