cd Executables\ProcessHacker\x64
ProcessHacker.exe -elevate -s -c -ctype service -cobject wuauserv -caction stop
timeout /t 8 /nobreak
ProcessHacker.exe -elevate -s -c -ctype service -cobject wuauserv -caction delete
timeout /t 8 /nobreak
ProcessHacker.exe -elevate -s -c -ctype service -cobject wuauserv -caction stop
timeout /t 8 /nobreak
ProcessHacker.exe -elevate -s -c -ctype service -cobject DoSvc -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject iphlpsvc -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject Winmgmt -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject ClipSVC -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject DiagTrack -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject RetailDemo -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject diagnosticshub.standardcollector.service -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject dmwappushservice -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject InstallService -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject LicenseManager -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject lfsvc -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject MapsBroker -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject NetTcpPortSharing -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject RemoteAccess -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject RemoteRegistry -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject SharedAccess -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject StorSvc -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject TrkWks -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject UsoSvc -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject WbioSrvc -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject WMPNetworkSvc -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject XblAuthManager -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject XblGameSave -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject XboxNetApiSvc -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject wlidsvc -caction stop
ProcessHacker.exe -elevate -s -c -ctype service -cobject ClipSVC -caction stop