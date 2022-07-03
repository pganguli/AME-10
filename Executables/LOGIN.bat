cd Executables
takeown /f C:\Windows\System32\en-US\credprovhost.dll.mui
icacls C:\Windows\System32\en-US\credprovhost.dll.mui /reset
del C:\Windows\System32\en-US\credprovhost.dll.mui /f /q
copy credprovhost.dll.mui C:\Windows\System32\en-US\ /Y
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /v 0