reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DownloadMode /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v DisableSettingSync /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v DisableSettingSyncUserOverride /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\EnhancedStorageDevices" /v TCGSecurityActivationDisabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers" /v authenticodeenabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v DontSendAdditionalData /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v value /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v value /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v NoGenTicket /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f

:: Autorun
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoAutorun /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 181 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v DisableAutoplay /t REG_DWORD /d 1 /f

:: Adobe Security Improvements
reg add "HKCU\SOFTWARE\Adobe" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\JSPrefs" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\JSPrefs" /v "bEnableJS" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\Originals" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\Originals" /v "bAllowOpenFile" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\Originals" /v "bSecureOpenFile" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\Privileged" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\Privileged" /v "bProtectedMode" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\TrustManager" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\TrustManager" /v "iProtectedView" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\TrustManager" /v "bEnhancedSecurityInBrowser" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\DC\TrustManager" /v "bEnhancedSecurityStandalone" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\JSPrefs" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\JSPrefs" /v "bEnableJS" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\Originals" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\Originals" /v "bAllowOpenFile" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\Originals" /v "bSecureOpenFile" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\Privileged" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\Privileged" /v "bProtectedMode" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\TrustManager" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\TrustManager" /v "iProtectedView" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\TrustManager" /v "bEnhancedSecurityInBrowser" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Adobe\Acrobat Reader\XI\TrustManager" /v "bEnhancedSecurityStandalone" /t REG_DWORD /d 1 /f

:: Office Security Improvements
reg add "HKCU\SOFTWARE\Microsoft\Office" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Excel"  /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Excel\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Excel\Security" /v "PackagerPrompt"=dword:00000002
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Excel\Security" /v "VBAWarnings"=dword:00000004
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Excel\Security" /v "WorkbookLinkWarnings"=dword:00000002
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\PowerPoint"  /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\PowerPoint\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\PowerPoint\Security" /v "PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\PowerPoint\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Word" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Word\Options" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Word\Options\vpref" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Word\Options\vpref" /v "fNoCalclinksOnopen_90_1" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Word\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Word\Security" /v"PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\12.0\Word\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Excel" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Excel\Options" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Excel\Options" /v "DontUpdateLinks" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Excel\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Excel\Security" /v "PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Excel\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Excel\Security" /v "WorkbookLinkWarnings" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\PowerPoint" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\PowerPoint\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\PowerPoint\Security" /v "PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\PowerPoint\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Word" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Word\Options" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Word\Options" /v "DontUpdateLinks" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Word\Options\WordMail" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Word\Options\WordMail" /v "DontUpdateLinks" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Word\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Word\Security" /v "PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Word\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\14.0\Word\Security" /v "AllowDDE" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Excel" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Excel\Options" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Excel\Options" /v "DontUpdateLinks" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Excel\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Excel\Security" /v "PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Excel\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Excel\Security" /v "WorkbookLinkWarnings" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\PowerPoint" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\PowerPoint\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\PowerPoint\Security" /v "PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\PowerPoint\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /v "DontUpdateLinks" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options\WordMail" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options\WordMail" /v "DontUpdateLinks" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Security" /v "PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Security" /v "AllowDDE" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Excel" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Options" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Options" /v "DontUpdateLinks" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Security" /v "PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Security" /v "WorkbookLinkWarnings" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint\Security" /v "PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v "DontUpdateLinks" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options\WordMail" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options\WordMail" /v "DontUpdateLinks" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Security" /v "PackagerPrompt" /t REG_DWORD /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Security" /v "VBAWarnings" /t REG_DWORD /d 4 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Security" /v "AllowDDE" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\Security" /t REG_SZ /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\Security" /v "DisableAllActiveX" /t REG_DWORD /d 1 /f

:: Remove SecurityHealth from startup
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "SecurityHealth" /f

:: Turns off Windows blocking installation of files downloaded from the internet
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f

:: Disables SmartScreen
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v ContentEvaluation /t REG_DWORD /d 0 /f

:: Remove Metadata Tracking
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /f

:: New Control Panel cleanup - List of commands: https://winaero.com/ms-settings-commands-in-windows-10/
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v SettingsPageVisibility /t REG_SZ /d "showonly:display;nightlight;sound;notifications;quiethours;powersleep;batterysaver;tabletmode;multitasking;clipboard;remote-desktop;about;bluetooth;connecteddevices;printers;mousetouchpad;devices-touchpad;typing;pen;autoplay;usb;network-status;network-cellular;network-wifi;network-wificalling;network-wifisettings;network-ethernet;network-dialup;network-vpn;network-airplanemode;network-mobilehotspot;datausage;network-proxy;personalization-background;personalization-start;fonts;colors;lockscreen;themes;taskbar;defaultapps;videoplayback;startupapps;dateandtime;regionformatting;gaming;gamemode;easeofaccess-display;easeofaccess-colorfilter;easeofaccess-audio;easeofaccess-easeofaccess-narrator;easeofaccess-magnifier;easeofaccess-highcontrast;easeofaccess-closedcaptioning;easeofaccess-speechrecognition;easeofaccess-eyecontrol;easeofaccess-keyboard;easeofaccess-mouse;cortana-windowssearch;search-moredetails" /f

:: Decrease shutdown time
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeOut /t REG_SZ /d 2000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v HungAppTimeout /t REG_SZ /d 2000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v AutoEndTasks /t REG_SZ /d 1 /f

:: Clean up the This PC Icon Selection
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f

:: Disable Storage Sense
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense" /f

:: Disable Windows Error Reporting
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD d/1 /f

:: Enables full drive indexing (Enhanced Search)
cd Executables
start NSudoLC.exe -U:S -P:E -M:S -Priority:RealTime -Wait SEARCH.bat

:: Search
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingEncryptedStoresOrItems" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AlwaysUseAutoLangDetection" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaInAmbientMode" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "HistoryViewEnabled" /t REG_DWORD 0 /f 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "HasAboveLockTips" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "SafeSearchMode" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationDefaultOn" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationEnableAboveLockscreen" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "DisableVoice" /t REG_DWORD /d 1 /f

for /f "tokens=* USEBACKQ" %%i in (`wmic useraccount where "name="%username%"" get sid ^| findstr "S-"`) do set currentusername=%%i
:: Trim 3 empty spaces off the end of the returned string
set currentusername=%currentusername:~0,-3%
reg add "HKEY_USERS\%currentusername%\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f
:: Firewall rules to prevent the startmenu from talking
reg add "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /v "Block Search SearchApp.exe" /t REG_SZ /d "v2.30|Action=Block|Active=TRUE|Dir=Out|RA42=IntErnet|RA62=IntErnet|App=C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy\SearchApp.exe|Name=Block Search SearchUI.exe|Desc=Block Cortana Outbound UDP/TCP Traffic|" /f
::reg add "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /v "Block Search Package" /t REG_SZ /d "v2.30|Action=Block|Active=TRUE|Dir=Out|RA42=IntErnet|RA62=IntErnet|Name=Block Search Package|Desc=Block Search Outbound UDP/TCP Traffic|AppPkgId=S-1-15-2-536077884-713174666-1066051701-3219990555-339840825-1966734348-1611281757|Platform=2:6:2|Platform2=GTEQ|" /f

:: Disable Timeline
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f

:: Setup Windows Explorer
:: Removes the shake to minimze all other windows gesture
::reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarGlomLevel /T REG_DWORD /D 2 /F
reg delete "HKEY_CLASSES_ROOT\CABFolder\CLSID" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.cab\CLSID" /f
reg delete "HKEY_CLASSES_ROOT\CompressedFolder\CLSID" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.zip\CLSID" /f

:: Taskbar
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v UseActionCenterExperience /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAHealth /t REG_DWORD /d 0x1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCortanaButton /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f

:: Remove the Open with Paint 3D from the explorer context menu
reg delete "HKLM\SOFTWARE\Classes\SystemFileAssociations\.bmp\Shell\3D Edit" /f
reg delete "HKLM\SOFTWARE\Classes\SystemFileAssociations\.jpeg\Shell\3D Edit" /f
reg delete "HKLM\SOFTWARE\Classes\SystemFileAssociations\.jpe\Shell\3D Edit" /f
reg delete "HKLM\SOFTWARE\Classes\SystemFileAssociations\.jpg\Shell\3D Edit" /f
reg delete "HKLM\SOFTWARE\Classes\SystemFileAssociations\.jpg\Shell\3D Edit" /f
reg delete "HKLM\SOFTWARE\Classes\SystemFileAssociations\.png\Shell\3D Edit" /f
reg delete "HKLM\SOFTWARE\Classes\SystemFileAssociations\.gif\Shell\3D Edit" /f
reg delete "HKLM\SOFTWARE\Classes\SystemFileAssociations\.tif\Shell\3D Edit" /f
reg delete "HKLM\SOFTWARE\Classes\SystemFileAssociations\.tiff\Shell\3D Edit" /f

echo.
echo Removing OneDrive from the Explorer Side Panel.
reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f

:: Disable ActiveProbing/NCSI
::reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v EnableActiveProbing /t REG_DWORD /d 0 /f

:: smb config
sc config lanmanworkstation depend= bowser/mrxsmb20/nsi

:: Set Time reference to UTC
reg add "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /t REG_DWORD /d 1 /f

::Disable Users On Login Screen
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v dontdisplaylastusername /t REG_DWORD /d 1 /f

::Disable The Lock Screen
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t REG_DWORD /d 1 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

:: Enable Legacy F8 Bootmenu
bcdedit /set {default} bootmenupolicy legacy
:: Disable Recovery
bcdedit /set {current} recoveryenabled no

:: Disable Hibernation to make NTFS accessable outside of Windows
powercfg /h off
:: Set Performance Plan to High Performance and display to never turn off
powercfg /S 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg /change monitor-timeout-ac 0