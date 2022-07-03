cd Executables

mkdir "C:\Users\%username%\AppData\Roaming\OpenShell"
mkdir "C:\Users\%username%\AppData\Roaming\OpenShell\Pinned"

copy "Firefox.lnk" "C:\Users\%username%\AppData\Roaming\OpenShell\Pinned\"
copy "Mozilla Thunderbird.lnk" "C:\Users\%username%\AppData\Roaming\OpenShell\Pinned\"

SETLOCAL ENABLEDELAYEDEXPANSION
SET LinkName=Windows Terminal
SET Esc_LinkDest=%%HOMEDRIVE%%\Users\%username%\AppData\Roaming\OpenShell\Pinned\!LinkName!.lnk
SET Esc_LinkTarget=%%HOMEDRIVE%%\Users\%username%\scoop\apps\windows-terminal\current\WindowsTerminal.exe
SET cSctVBS=CreateShortcut.vbs
(
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^) 
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("!Esc_LinkDest!"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^) 
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("!Esc_LinkTarget!"^)
  echo oLink.Save
)1>!cSctVBS!
cscript //nologo .\!cSctVBS!
DEL !cSctVBS! /f /q

copy "Windows Terminal.lnk" "C:\Users\%username%\AppData\Roaming\OpenShell\Pinned\"

del /f /q "C:\Users\%username%\Desktop\Microsoft Edge.lnk"
del /f /q "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessories\Internet Explorer.lnk"
del /f /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Windows Media Player.lnk"