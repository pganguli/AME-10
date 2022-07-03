@ECHO OFF
NET SESSION > NUL 2>&1
	IF %ERRORLEVEL% NEQ 0 (
		ECHO Script must be run from an elevated cmd prompt
		EXIT /B 1
	)

ECHO. & ECHO ^| AME Firefox Injection Script v3.0 ^| & ECHO.

IF NOT EXIST "%~dp0\AME-Firefox-Injection" (
	ECHO No supplied AME-Firefox-Injection folder detected.
	EXIT /B 4
)

:ENTRIES

ECHO Grabbing previous Firefox entries...

IF NOT EXIST "%TEMP%\Firefox-Reg-Output.txt" ECHO No input entries detected & ECHO. & ECHO Generating random string... & ECHO. & GOTO GenRND

SETLOCAL EnableDelayedExpansion
SET /A "count1=0"
FOR /F "usebackq tokens=2 delims=-" %%A IN (`FINDSTR /c:"Firefox-" "%TEMP%\Firefox-Reg-Output.txt"`) DO (
	SET /A "count1=!count1!+1"
	SET "ffBef!count1!=%%A"
	SET "par=!par!)"
	SET "arg=!arg!IF NOT "%%D"=="%%A" ("
)

DEL /Q /F "%TEMP%\Firefox-Reg-Output.txt" > NUL 2>&1

ECHO. & ECHO Grabbing and comparing Firefox entries...
SET /A "count2=0"
FOR /F "usebackq tokens=2 delims=-" %%D IN (`REG query "HKLM\SOFTWARE\Clients\StartMenuInternet" /f "Firefox-"`) DO (
	SET /A "count2=!count2!+1"
	%arg%SET "NewCode=%%D"%par%
)

ECHO. & ECHO Generating random string... & ECHO.

:GenRND

SET "RNDConsist=abcdefghijklmnopqrstuvwxyz0123456789"
SET /A "RND=%RANDOM% %% 36"
SET "RNDResult=!RNDResult!!RNDConsist:~%RND%,1!"
IF "%RNDResult:~7%"=="" (GOTO GenRND)

IF "%count1%"=="0" (IF "%count2%"=="0" (SET "NewCode=NULL"))
ENDLOCAL & SET "NewCode=%NewCode%" & SET "RNDStr=%RNDResult%"

:CHECKS

REM Redundancy, incase the original Firefox installed check fails
IF "%NewCode%"=="NULL" ECHO No Firefox install detected & ECHO. & SET "prefsOnly=true"
IF "%NewCode%"=="" ECHO Firefox version already installed & ECHO. & SET "prefsOnly=true"
IF NOT EXIST "%PROGRAMFILES%\Mozilla Firefox\firefox.exe" ECHO Can't find Firefox.exe & ECHO. & SET "prefsOnly=true"
IF EXIST "%APPDATA%\Mozilla\Firefox\profiles.ini" (
	FINDSTR /c:"%NewCode%" "%APPDATA%\Mozilla\Firefox\profiles.ini" > NUL 2>&1
		IF NOT ERRORLEVEL 1 ECHO Firefox version already in profiles.ini & ECHO. & SET "prefsOnly=true"
)

IF "%prefsOnly%"=="true" GOTO PREFSONLY

SET /A "count0=1"

:PROFILENAME

IF %count0% GTR 50 ECHO Default-release count exceeded 50 & GOTO PREFSONLY
IF EXIST "%APPDATA%\Mozilla\Firefox\profiles.ini" (
	FINDSTR /c:"Name=default-release" "%APPDATA%\Mozilla\Firefox\profiles.ini" > NUL 2>&1
		IF NOT ERRORLEVEL 1 (
			FINDSTR /c:"Name=default-release-%count0%" "%APPDATA%\Mozilla\Firefox\profiles.ini"
				IF NOT ERRORLEVEL 1 (
					SET /A "count0=%count0%+1"
					GOTO PROFILENAME
				) ELSE (
					SET "profileName=default-release-%count0%"
				)
		) ELSE (
			SET "profileName=default-release"
		)
) ELSE (
	SET "profileName=default-release"
)

ECHO Injecting profile...
REM This could also be set manually in the profiles.ini file
POWERSHELL -NoP -C "Start-Process '%PROGRAMFILES%\Mozilla Firefox\firefox.exe' -ArgumentList '-CreateProfile','"""%profileName% %APPDATA%\Mozilla\Firefox\Profiles\%RNDStr%.%profileName%"""','--no-remote' -Wait"
ROBOCOPY "%~dp0\AME-Firefox-Injection" "%APPDATA%\Mozilla\Firefox\Profiles\%RNDStr%.%profileName%" /E > NUL

REM Sets profile as the default
ECHO [Install%NewCode%]>> "%APPDATA%\Mozilla\Firefox\profiles.ini"
ECHO Default=Profiles/%RNDStr%.%profileName%>> "%APPDATA%\Mozilla\Firefox\profiles.ini"
ECHO Locked=^1>> "%APPDATA%\Mozilla\Firefox\profiles.ini"

REM Add prefs to any other Firefox profiles in all users
FOR /F "usebackq delims=" %%A IN (`DIR /B /A:d "%SYSTEMDRIVE%\Users"`) DO (
	IF EXIST "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles" (
		FOR /F "usebackq delims=" %%B IN (`DIR /B /A:d "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles" ^| FINDSTR /v /x /c:"%RNDStr%.%profileName%"`) DO (
			SET /A "count3=%count3%+1"
			IF EXIST "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\prefs.js" (
				REM Removes lines containing these entries from the profiles prefs.js. This way any old prefs don't overlap with the new prefs
				FINDSTR /V /C:""""app.shield.optoutstudies.enabled"""" /C:""""browser.aboutwelcome.enabled"""" /C:""""browser.disableResetPrompt"""" /C:""""browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons"""" /C:""""browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features"""" /C:""""browser.newtabpage.activity-stream.feeds.section.topstories"""" /C:""""browser.newtabpage.activity-stream.feeds.topsites"""" /C:""""browser.newtabpage.activity-stream.section.highlights.includePocket"""" /C:""""browser.newtabpage.activity-stream.section.highlights.includeVisited"""" /C:""""browser.newtabpage.activity-stream.showSponsored"""" /C:""""browser.newtabpage.activity-stream.showSponsoredTopSites"""" /C:""""browser.urlbar.placeholderNam"""" /C:""""browser.urlbar.suggest.quicksuggest.nonsponsored"""" /C:""""browser.urlbar.suggest.quicksuggest.sponsored"""" /C:""""browser.urlbar.suggest.topsites"""" /C:""""datareporting.healthreport.uploadEnabled"""" /C:""""dom.security.https_only_mode"""" /C:""""dom.security.https_only_mode_ever_enabled"""" "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\prefs.js ">> "%TEMP%\prefs.js.tmp"
			)
			REM Filters out a few prefs from AME-Firefox-Injectiont\prefs.js and adds them to prefs.js.tmp
			FINDSTR /V /C:""""browser.toolbars.bookmarks.visibility"""" /C:""""extensions.webextensions.uuids"""" /C:""""extensions.webextensions.uuids"""" "%~dp0\AME-Firefox-Injection\prefs.js" >> "%TEMP%\prefs.js.tmp"
			MOVE /Y "%TEMP%\prefs.js.tmp" "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\prefs.js" > NUL
			IF EXIST "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\search.json.mozlz4" DEL /Q /F "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\search.json.mozlz4" > NUL
			ROBOCOPY "%~dp0\AME-Firefox-Injection" "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B" search.json.mozlz4 /E > NUL
			POWERSHELL -NoP -C "Get-Acl '%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles' | Set-Acl '%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\prefs.js'" > NUL 2>&1
			POWERSHELL -NoP -C "Get-Acl '%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles' | Set-Acl '%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\search.json.mozlz4'" > NUL 2>&1
		)	
	)
)

SET "ERRORCODE=0"
GOTO COMPLETE

:PREFSONLY

REM uBlock Origin could be installed automatically here, however that would involve overwriting the old extension.json etc
REM files, which, if the user had previous extensions, could cause issues.

ECHO Injecting config files...

IF EXIST "%TEMP%\prefs.js.tmp" DEL /F /Q "%TEMP%\prefs.js.tmp" > NUL

SET /A "count3=0"

FOR /F "usebackq delims=" %%A IN (`DIR /B /A:d "%APPDATA%\Mozilla\Firefox\Profiles"`) DO (
	SET /A "count3=%count3%+1"
	IF EXIST "%APPDATA%\Mozilla\Firefox\Profiles\%%A\prefs.js" (
		REM Removes lines containing these entries from the profiles prefs.js. This way any old prefs don't overlap with the new prefs
		FINDSTR /V /C:""""app.shield.optoutstudies.enabled"""" /C:""""browser.aboutwelcome.enabled"""" /C:""""browser.disableResetPrompt"""" /C:""""browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons"""" /C:""""browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features"""" /C:""""browser.newtabpage.activity-stream.feeds.section.topstories"""" /C:""""browser.newtabpage.activity-stream.feeds.topsites"""" /C:""""browser.newtabpage.activity-stream.section.highlights.includePocket"""" /C:""""browser.newtabpage.activity-stream.section.highlights.includeVisited"""" /C:""""browser.newtabpage.activity-stream.showSponsored"""" /C:""""browser.newtabpage.activity-stream.showSponsoredTopSites"""" /C:""""browser.urlbar.placeholderNam"""" /C:""""browser.urlbar.suggest.quicksuggest.nonsponsored"""" /C:""""browser.urlbar.suggest.quicksuggest.sponsored"""" /C:""""browser.urlbar.suggest.topsites"""" /C:""""datareporting.healthreport.uploadEnabled"""" /C:""""dom.security.https_only_mode"""" /C:""""dom.security.https_only_mode_ever_enabled"""" "%APPDATA%\Mozilla\Firefox\Profiles\%%A\prefs.js ">> "%TEMP%\prefs.js.tmp"
	)
	REM Filters out a few prefs from AME-Firefox-Injectiont\prefs.js and adds them to prefs.js.tmp
	FINDSTR /V /C:""""browser.toolbars.bookmarks.visibility"""" /C:""""extensions.webextensions.uuids"""" /C:""""extensions.webextensions.uuids"""" "%~dp0\AME-Firefox-Injection\prefs.js" >> "%TEMP%\prefs.js.tmp"
	MOVE /Y "%TEMP%\prefs.js.tmp" "%APPDATA%\Mozilla\Firefox\Profiles\%%A\prefs.js" > NUL
	IF EXIST "%APPDATA%\Mozilla\Firefox\Profiles\%%A\search.json.mozlz4" DEL /Q /F "%APPDATA%\Mozilla\Firefox\Profiles\%%A\search.json.mozlz4" > NUL
	ROBOCOPY "%~dp0\AME-Firefox-Injection" "%APPDATA%\Mozilla\Firefox\Profiles\%%A" search.json.mozlz4 /E > NUL
)
FOR /F "usebackq delims=" %%A IN (`DIR /B /A:d "%SYSTEMDRIVE%\Users"`) DO (
	IF EXIST "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles" (
		FOR /F "usebackq delims=" %%B IN (`DIR /B /A:d "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles"`) DO (
			SET /A "count3=%count3%+1"
			IF EXIST "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\prefs.js" (
				REM Removes lines containing these entries from the profiles prefs.js. This way any old prefs don't overlap with the new prefs
				FINDSTR /V /C:""""app.shield.optoutstudies.enabled"""" /C:""""browser.aboutwelcome.enabled"""" /C:""""browser.disableResetPrompt"""" /C:""""browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons"""" /C:""""browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features"""" /C:""""browser.newtabpage.activity-stream.feeds.section.topstories"""" /C:""""browser.newtabpage.activity-stream.feeds.topsites"""" /C:""""browser.newtabpage.activity-stream.section.highlights.includePocket"""" /C:""""browser.newtabpage.activity-stream.section.highlights.includeVisited"""" /C:""""browser.newtabpage.activity-stream.showSponsored"""" /C:""""browser.newtabpage.activity-stream.showSponsoredTopSites"""" /C:""""browser.urlbar.placeholderNam"""" /C:""""browser.urlbar.suggest.quicksuggest.nonsponsored"""" /C:""""browser.urlbar.suggest.quicksuggest.sponsored"""" /C:""""browser.urlbar.suggest.topsites"""" /C:""""datareporting.healthreport.uploadEnabled"""" /C:""""dom.security.https_only_mode"""" /C:""""dom.security.https_only_mode_ever_enabled"""" "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\prefs.js ">> "%TEMP%\prefs.js.tmp"
			)
			REM Filters out a few prefs from AME-Firefox-Injectiont\prefs.js and adds them to prefs.js.tmp
			FINDSTR /V /C:""""browser.toolbars.bookmarks.visibility"""" /C:""""extensions.webextensions.uuids"""" /C:""""extensions.webextensions.uuids"""" "%~dp0\AME-Firefox-Injection\prefs.js" >> "%TEMP%\prefs.js.tmp"
			MOVE /Y "%TEMP%\prefs.js.tmp" "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\prefs.js" > NUL
			IF EXIST "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\search.json.mozlz4" DEL /Q /F "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\search.json.mozlz4" > NUL
			ROBOCOPY "%~dp0\AME-Firefox-Injection" "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B" search.json.mozlz4 /E > NUL
			POWERSHELL -NoP -C "Get-Acl '%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles' | Set-Acl '%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\prefs.js'" > NUL 2>&1
			POWERSHELL -NoP -C "Get-Acl '%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles' | Set-Acl '%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Mozilla\Firefox\Profiles\%%B\search.json.mozlz4'" > NUL 2>&1
		)
	)
)
IF %count3% EQU 0 ECHO Failed! No profiles detected & SET "ERRORCODE=2" & GOTO COMPLETE 

SET "ERRORCODE=1"

:COMPLETE

IF NOT %ERRORCODE% EQU 2 ECHO. & ECHO Successfully injected custom Firefox configs.
EXIT /B %ERRORCODE%

REM Errorcode 0 = Created new profile and injected; 1 = Firefox existed, injected custom prefs.js and search.json.mozlz4; 2 = Totally failed, no firefox detected, no profiles detected; 4 = No supplied AME-Firefox-Injection folder detected.