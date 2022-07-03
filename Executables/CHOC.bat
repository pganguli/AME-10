start explorer.exe

reg query "HKLM\SOFTWARE\Clients\StartMenuInternet" /k /f "Firefox-" > "%TEMP%\Firefox-Reg-Output.txt"

@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
@powershell -NoProfile -ExecutionPolicy Bypass -Command "choco install -y --force --allow-empty-checksums firefox thunderbird open-shell vlc 7zip jpegview vcredist-all directx onlyoffice cascadiamono"

cd Executables
copy Fluent-Metro.skin "C:\Program Files\Open-Shell\Skins"
copy Fluent-Metro.skin7 "C:\Program Files\Open-Shell\Skins"

powershell -NoProfile -ExecutionPolicy Bypass -File .\clickstart.ps1

for /f "tokens=* USEBACKQ" %%i in (`wmic useraccount where "name="%username%"" get sid ^| findstr "S-"`) do set currentusername=%%i
set currentusername=%currentusername:~0,-3%
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell" /t REG_SZ /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\OpenShell" /t REG_SZ /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\OpenShell\Settings" /t REG_SZ /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu" /t REG_SZ /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /t REG_SZ /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\ClassicExplorer" /t REG_SZ /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\ClassicExplorer\Settings" /t REG_SZ /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\ClassicExplorer" /v "CSettingsDlg" /t REG_BINARY /d a8030000d00100000000000000000000aa0f00000100010100000000 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\ClassicExplorer" /v "ShowedToolbar" /t REG_DWORD /d 1 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\ClassicExplorer" /v "NewLine" /t REG_DWORD /d 0 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\ClassicExplorer\Settings" /v "ShowStatusBar" /t REG_DWORD /d 0 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu" /v "ShowedStyle2" /t REG_DWORD /d 1 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu" /v "CSettingsDlg" /t REG_BINARY /d c80100001a0100000000000000000000360d00000100000000000000 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu" /v "OldItems" /t REG_BINARY /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu" /v "ItemRanks" /t REG_BINARY /d 0 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\MRU" /v "0" /t REG_SZ /d "C:\Windows\regedit.exe" /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "Version" /t REG_DWORD /d 04040098 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "AllProgramsMetro" /t REG_DWORD /d 1 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "RecentMetroApps" /t REG_DWORD /d 1 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "StartScreenShortcut" /t REG_DWORD /d 0 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "SearchInternet" /t REG_DWORD /d 0 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "GlassOverride" /t REG_DWORD /d 1 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "GlassColor" /t REG_DWORD /d 0 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkinW7" /t REG_SZ /d "Fluent-Metro" /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkinVariationW7" /t REG_SZ /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "ShiftWin" /t REG_SZ /d "Nothing" /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkinOptionsW7" /t REG_MULTI_SZ /d "DARK_MAIN=0"\0"METRO_MAIN=0"\0"LIGHT_MAIN=0"\0"AUTOMODE_MAIN=1"\0"DARK_SUBMENU=0"\0"METRO_SUBMENU="\0"LIGHT_SUBMENU=0"\0"AUTOMODE_SUBMENU=1"\0"SUBMENU_SEPARATORS=1"\0"DARK_SEARCH=0"\0"METRO_SEARCH="\0"LIGHT_SEARCH=0"\0"AUTOMODE_SEARCH=1"\0"SEARCH_FRAME=1"\0"SEARCH_COLOR=0"\0"SMALL_SEARCH=0"\0"MOERN_SEARCH=1"\0"SEARCH_ITALICS=0"\0"NONE=0"\0"SEPARATOR=0"\0"TWO_TONE=1"\0"CLASSIC_SELECTOR=1"\0"HAF_SELECTOR=0"\0"CURVED_MENUSEL=1"\0"CURVED_SUBMENU=0"\0"SELECTOR_REVEAL=1"\0"TRANSPARENT=0"\0"OPAQU_SUBMENU=1"\0"OPAQUE_MENU=0"\0"OPAQUE=0"\0"STANDARD=0"\0"SMALL_MAIN2=1"\0"SMALL_ICONS=0"\0"COMPACT_UBMENU=0"\0"PRESERVE_MAIN2=0"\0"LESS_PADDING=0"\0"EXTRA_PADDING=1"\0"24_PADDING=0"\0"LARGE_PROGRAMS0"\0"TRANSPARENT_SHUTDOWN=0"\0"OUTLINE_SHUTDOWN=0"\0"BUTTON_SHUTDOWN=1"\0"EXPERIMENTAL_SHUTDOWN=0"\"LARGE_FONT=0"\0"CONNECTED_BORDER=1"\0"FLOATING_BORDER=0"\0"LARGE_SUBMENU=0"\0"LARGE_LISTS=0"\0"THI_MAIN2=0"\0"EXPERIMENTAL_MAIN2=1"\0"USER_IMAGE=1"\0"USER_OUTSIDE=0"\0"SCALING_USER=1"\0"56=0"\0"64="\0"TRANSPARENT_USER=0"\0"UWP_SCROLLBAR=0"\0"MODERN_SCROLLBAR=1"\0"SMALL_ARROWS=0"\0"ARROW_BACKGROUD=1"\0"ICON_FRAME=0"\0"SEARCH_SEPARATOR=0"\0"NO_PROGRAMS_BUTTON=0" /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkipMetro" /t REG_DWORD /d 1 /f
reg add "HKEY_USERS\%currentusername%\SOFTWARE\OpenShell\StartMenu\Settings" /v "MenuItems7" /t REG_MULTI_SZ /d "Item1.Command=user_files"\0"Item1.Settings=NOEXPAND"\0"Item2.Command=user_documents"\0"Item2.Settings=NOEXPAND"\0"Item3.Command=user_pictures"\0"Item3.Settings=NOEXPAND"\0"Item4.Command=user_music"\0"Item4.Settings=NOEXPAND"\0"Item5.Command=user_videos"\0"Item5.Settings=NOEXPAND"\0"Item6.Command=downloads"\0"Item6.Settings=NOEXPAND"\0"Item7.Command=homegroup"\0"Item7.Settings=ITEM_DISABLED"\0"Item8.Command=separator"\0"Item9.Command=games"\0"Item9.Settings=TRACK_RECENT|NOEXPAND|ITEM_DISABLED"\0"Item10.Command=favorites"\0"Item10.Settings=ITEM_DISABLED"\0"Item11.Command=recent_documents"\0"Item12.Command=computer"\0"Item12.Settings=NOEXPAND"\0"Item13.Command=network"\0"Item13.Settings=ITEM_DISABLED"\0"Item14.Command=network_connections"\0"Item14.Settings=ITEM_DISABLED"\0"Item15.Command=separator"\0"Item16.Command=control_panel"\0"Item16.Settings=TRACK_RECENT"\0"Item17.Command=pc_settings"\0"Item17.Settings=TRACK_RECENT"\0"Item18.Command=admin"\0"Item18.Settings=TRACK_RECENT|ITEM_DISABLED"\0"Item19.Command=devices"\0"Item19.Settings=ITEM_DISABLED"\0"Item20.Command=defaults"\0"Item20.Settings=ITEM_DISABLED"\0"Item21.Command=help"\0"Item21.Settings=ITEM_DISABLED"\0"Item22.Command=run"\0"Item23.Command=apps"\0"Item23.Settings=ITEM_DISABLED"\0"Item24.Command=windows_security"\0"Item24.Settings=ITEM_DISABLED"\0" /f
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Toolbar\ShellBrowser" /v "ITBar7Layout" /t REG_BINARY /d 13000000000000000000000020000000100000000000000001000000010700005e01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 /f

del "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessories\Internet Explorer.lnk"
del "C:\Users\%username%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk"
del "C:\Users\%username%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk"