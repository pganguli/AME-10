if exist OldCalculatorforWindows10Cfg.exe (
    del OldCalculatorforWindows10Cfg.exe /f /q
)

if exist OldNewExplorerCfg.exe (
    del OldNewExplorerCfg.exe /f /q
)

.\7za.exe e .\silent_installers.7z -pwizard

::Install Old Calculator For Windows 10
:calc
start OldCalculatorforWindows10Cfg.exe
timeout /t 15

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\calc.exe"
if %ERRORLEVEL% NEQ 0 goto calc

::Install OldNewExplorer
:oldnewexplorer

start OldNewExplorerCfg.exe
@powershell -NoProfile -ExecutionPolicy Bypass -File Enter.ps1
timeout /t 2
taskkill /im OldNewExplorerCfg.exe
reg add HKEY_CURRENT_USER\SOFTWARE\Tihiy\OldNewExplorer /v Details /t REG_DWORD /d 1 /f
reg query "HKCU\Software\Tihiy\OldNewExplorer"

if %ERRORLEVEL% NEQ 0 goto oldnewexplorer