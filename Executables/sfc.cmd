@ECHO OFF
SETLOCAL

REM This script is to prevent users from unknowingly entering sfc /scannow
REM and causing de-amelioration

NET session > NUL 2>&1
	IF %ERRORLEVEL% GTR 0 (
		ECHO.
		ECHO You must be an administrator running a console session in order to
		ECHO use the sfc utility.
		
		ENDLOCAL & EXIT /B 1
	) ELSE (
		GOTO checkScannow
	)

:checkScannow

SET "sfcArgs=%*"
SET "sfcArgs=%sfcArgs:"=:AINV:%"
SET "sfcArgs=%sfcArgs:"=:AINV:%"

ECHO "%sfcArgs%" | FINDSTR /i /c:"/scannow" > NUL 2>&1
	IF %ERRORLEVEL% EQU 0 (
		GOTO scannowProcedure
	) ELSE (
		GOTO verifyOnlyProcedure
	)

:verifyOnlyProcedure

IF /i "%sfcArgs%"=="/verifyonly" (
	ECHO.
	ECHO Beginning system scan.  This process will take some time.
	TIMEOUT /T 1 /NOBREAK > NUL 2>&1
	ECHO.
	ECHO Beginning verification phase of system scan.
	TIMEOUT /T 2 /NOBREAK > NUL 2>&1
	ECHO Verifying...
		
	REM %* is all the text entered after "sfc ".
	sfc1 %* > NUL 2>&1

	ECHO.
	ECHO Windows Resource Protection found integrity violations.
	ECHO For online repairs, details are included in the CBS log file located at
	ECHO windir^\Logs^\CBS^\CBS.log. For example C^:^\Windows^\Logs^\CBS^\CBS.log. For offline
	ECHO repairs, details are included in the log file provided by the ^/OFFLOGFILE flag.

	ENDLOCAL & EXIT /B 0
) ELSE (
	GOTO incorrectSyntaxMessage	)

:incorrectSyntaxMessage

sfc1 %sfcArgs% > NUL 2>&1
	IF %ERRORLEVEL% GTR 0 (

		ECHO.
		ECHO System File Checker
		ECHO.
		ECHO Scans the integrity of all protected system files and replaces incorrect versions with
		ECHO correct Microsoft versions.
		ECHO.
		ECHO SFC ^[^/SCANNOW^] ^[^/VERIFYONLY^] ^[^/SCANFILE^=^<file^>^] ^[^/VERIFYFILE^=^<file^>]
		ECHO     ^[^/OFFWINDIR^=^<offline windows directory^> ^/OFFBOOTDIR^=^<offline boot directory^> ^[^/OFFLOGFILE^=^<log file path^>^]^]
		ECHO. 
		ECHO ^/SCANNOW        Scans integrity of all protected system files and repairs files with
		ECHO                 problems when possible.
		ECHO ^/VERIFYONLY     Scans integrity of all protected system files. No repair operation is
		ECHO                 performed.
		ECHO ^/SCANFILE       Scans integrity of the referenced file, repairs file if problems are
		ECHO                 identified. Specify full path ^<file^>
		ECHO ^/VERIFYFILE     Verifies the integrity of the file with full path ^<file^>.  No repair
		ECHO                 operation is performed.
		ECHO ^/OFFBOOTDIR     For offline repair, specify the location of the offline boot directory
		ECHO ^/OFFWINDIR      For offline repair, specify the location of the offline windows directory
		ECHO ^/OFFLOGFILE     For offline repair, optionally enable logging by specifying a log file path
		ECHO. 
		ECHO e.g.
		ECHO. 
		ECHO         sfc ^/SCANNOW
		ECHO         sfc ^/VERIFYFILE^=c^:^\windows^\system32^\kernel32.dll
		ECHO         sfc ^/SCANFILE^=d^:^\windows^\system32^\kernel32.dll ^/OFFBOOTDIR^=d^:^\ ^/OFFWINDIR^=d^:^\windows
		ECHO         sfc ^/SCANFILE^=d^:^\windows^\system32^\kernel32.dll ^/OFFBOOTDIR^=d^:^\ ^/OFFWINDIR^=d^:^\windows ^/OFFLOGFILE^=c^:^\log.txt
		ECHO         sfc ^/VERIFYONLY

		ENDLOCAL & EXIT /B 2
) ELSE (
	GOTO grabCBSInfo
)

:grabCBSInfo

SETLOCAL EnableDelayedExpansion
SET "count=1"
FOR /F "tokens=2 delims=]" %%A IN ('powershell -command "Get-Content '%SYSTEMROOT%\Logs\CBS\CBS.log' -tail 3"') DO (
	SET "var!count!=%%A"
	SET /A "count=!count!+1"
)
GOTO noViolationProcedure

:noViolationProcedure

SET "var2=%var2:"=:AINV:%"
SET "var2=%var2:"=:AINV:%"
ECHO "%var2%" | FINDSTR /i /c:"Beginning" > NUL 2>&1
	IF %ERRORLEVEL% EQU 0 (
		ECHO.
		ECHO Windows Resource Protection did not find any integrity violations.

		ENDLOCAL & ENDLOCAL & EXIT /B 0
	) ELSE (
		GOTO foundViolationProcedure
	)

:foundViolationProcedure

SET "var1=%var1:"=:AINV:%"
SET "var1=%var1:"=:AINV:%"
ECHO "%var1%" | FINDSTR /i /c:"reproject" > NUL 2>&1
	IF %ERRORLEVEL% EQU 0 (
		ECHO.
		ECHO Windows Resource Protection found integrity violations.
		ECHO For online repairs, details are included in the CBS log file located at
    	ECHO windir^\Logs^\CBS\CBS.log. For example C^:^\Windows^\Logs^\CBS^\CBS.log. For offline
		ECHO repairs, details are included in the log file provided by the ^/OFFLOGFILE flag.

		ENDLOCAL & ENDLOCAL & EXIT /B 3
	) ELSE (
		REM This will most likely never happen
		ENDLOCAL & GOTO :unknownResults
	)

:unknownResults

ECHO.
ECHO Cannot output results. Details are included in the CBS log file located at
ECHO windir^\Logs^\CBS\CBS.log.

ENDLOCAL & EXIT /B 4

:scannowProcedure

ECHO.
ECHO This command will cause de-amelioration! DO NOT RUN!
ECHO Are you sure you want to run this command?
ECHO.
ECHO Enter 'Cancel' to Exit
		
SET /P "input=Enter 'I know what I'm doing' to Confirm: "
	IF "%input%"=="I know what I'm doing" GOTO scannowSelfDestruct
	IF /I "%input%"=="Cancel" ENDLOCAL & EXIT /B 0
		
ECHO.
ECHO Incorrect input entered.
			
ENDLOCAL & EXIT /B 5

:scannowSelfDestruct

:: This will cause sfc.cmd to no longer function, unless sfc.cmd is specified.
:: This is due to the .exe extension being prioritized over .cmd. The PATHEXT environment variable can change this.
TAKEOWN /f %SYSTEMROOT%\System32\sfc1.exe /a > NUL 2>&1
ICACLS %SYSTEMROOT%\System32\sfc1.exe /grant Administrators:F > NUL 2>&1
REN %SYSTEMROOT%\System32\sfc1.exe sfc.exe > NUL 2>&1

:: Copy ACL from diskmgmt.msc to sfc.exe. Essentially resetting sfc.exe's ACL.
POWERSHELL -command "Get-Acl %SYSTEMROOT%\System32\diskmgmt.msc | Set-Acl %SYSTEMROOT%\System32\sfc.exe" > NUL 2>&1

:: Self-destruction
TAKEOWN /f %SYSTEMROOT%\System32\sfc.cmd /a > NUL 2>&1
ICACLS %SYSTEMROOT%\System32\sfc.cmd /grant Administrators:F > NUL 2>&1
(GOTO) 2>NUL & DEL /Q /F "%~f0">NUL 2>&1 & sfc %*
