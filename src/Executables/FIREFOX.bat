@echo OFF

echo. & echo Grabbing previous Firefox entries...

for /f "usebackq tokens=2 delims=-" %%A in (`reg query "HKLM\SOFTWARE\Clients\StartMenuInternet" /k /f "Firefox-" ^| findstr /c:"Firefox-"`) do (
	set /a "count1=!count1!+1"
	set "ffBef!count1!=%%A"
	set "par=!par!)"
	set "arg=!arg!if not "%%D"=="%%A" ("
)

PowerShell -NoP -C "Start-Process '%ProgramData%\chocolatey\bin\choco.exe' -ArgumentList 'install','-y','--allow-empty-checksums','firefox' -NoNewWindow -Wait"
PowerShell -NoP -C "Start-Process '%ProgramData%\chocolatey\bin\choco.exe' -ArgumentList 'upgrade','-y','--allow-empty-checksums','firefox' -NoNewWindow -Wait"

call :setAssociations

exit /b 0

:setAssociations

for /f "usebackq tokens=2 delims=\" %%A in (`reg query "HKEY_USERS" ^| findstr /r /x /c:"HKEY_USERS\\S-.*" /c:"HKEY_USERS\\AME_UserHive_[^_]*"`) do (
	REM If the "Volatile Environment" key exists, that means it is a proper user. Built in accounts/SIDs don't have this key.
	reg query "HKU\%%A" | findstr /c:"Volatile Environment" /c:"AME_UserHive_" > NUL 2>&1
		if not errorlevel 1 (
			PowerShell -NoP -ExecutionPolicy Bypass -File assoc.ps1 "Placeholder" "%%A" ".html:FirefoxHTML-308046B0AF4A39CB" ".htm:FirefoxHTML-308046B0AF4A39CB" "Proto:https:FirefoxURL-308046B0AF4A39CB" "Proto:http:FirefoxURL-308046B0AF4A39CB"
	)
)
