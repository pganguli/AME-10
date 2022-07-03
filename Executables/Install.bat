cd C:\Users\Yoh\Desktop\OldNewExplorer-1.1.9
start OldNewExplorerCfg.exe
@powershell -NoProfile -ExecutionPolicy Bypass -File Enter.ps1
timeout /t 2
taskkill /im OldNewExplorerCfg.exe
reg add HKEY_CURRENT_USER\SOFTWARE\Tihiy\OldNewExplorer /v Details /t REG_DWORD /d 1 /f