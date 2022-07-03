@ECHO OFF

ECHO. & ECHO ^| AME SFC Modification Deployment Script v2.5 ^| & ECHO.

NET session > NUL 2>&1
	IF %ERRORLEVEL% LSS 1 (
		GOTO sfcCmdChecks
	) ELSE (
		ECHO Script must be run from an elevated cmd prompt
		EXIT /B 1
	)

:sfcCmdChecks

IF NOT EXIST "%~dp0\sfc.cmd" (
		ECHO No supplied sfc.cmd detected
		EXIT /B 2
)

IF EXIST "%SYSTEMROOT%\System32\sfc.cmd" (
	TAKEOWN /f "%SYSTEMROOT%\System32\sfc.cmd" /a > NUL 2>&1
	ICACLS "%SYSTEMROOT%\System32\sfc.cmd" /grant Administrators:F > NUL 2>&1
	DEL /Q /F "%SYSTEMROOT%\System32\sfc.cmd"
	GOTO move
) ELSE (
	GOTO move
)

:move

MOVE /Y "%~dp0\sfc.cmd" "%SYSTEMROOT%\System32\" 1> NUL

:sfc1ExeCheck

IF EXIST "%SYSTEMROOT%\System32\sfc1.exe" (
	ECHO sfc1.exe already exists, assigning permissions... & ECHO.

	POWERSHELL -NoP -C "Get-Acl '%SYSTEMROOT%\System32\diskmgmt.msc' | Set-Acl '%SYSTEMROOT%\System32\sfc1.exe'" > NUL 2>&1
	POWERSHELL -NoP -C "Get-Acl '%SYSTEMROOT%\System32\diskmgmt.msc' | Set-Acl '%SYSTEMROOT%\System32\sfc.cmd'" > NUL 2>&1
	GOTO complete
) ELSE (
	GOTO managePermissions
)

:managePermissions

ECHO Assigning permissions and renaming sfc.exe... & ECHO.

REM Copies the ACL from diskmgmt.msc to sfc.cmd.
POWERSHELL -NoP -C "Get-Acl '%SYSTEMROOT%\System32\diskmgmt.msc' | Set-Acl '%SYSTEMROOT%\System32\sfc.cmd'" > NUL 2>&1

REM Gives the Administrator group full access for renaming sfc.exe to sfc1.exe.
TAKEOWN /f "%SYSTEMROOT%\System32\sfc.exe" /a > NUL 2>&1
ICACLS "%SYSTEMROOT%\System32\sfc.exe" /grant Administrators:F > NUL 2>&1

GOTO renameSFCExe

:renameSFCExe

REN "%SYSTEMROOT%\System32\sfc.exe" "sfc1.exe" > NUL 2>&1

REM Copies the ACL from diskmgmt.msc to sfc1.exe. Essentially resetting its ACL.
POWERSHELL -NoP -C "Get-Acl '%SYSTEMROOT%\System32\diskmgmt.msc' | Set-Acl '%SYSTEMROOT%\System32\sfc1.exe'" > NUL 2>&1
GOTO complete

:complete

ECHO Successfully deployed sfc modification.
EXIT /B 0
