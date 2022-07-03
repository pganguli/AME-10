cd Executables
takeown /f C:\Windows\Web\Screen\*.jpg
icacls C:\Windows\Web\Screen\*.jpg /reset
takeown /f C:\Windows\Web\Screen\*.png
icacls C:\Windows\Web\Screen\*.png /reset
takeown /f C:\Windows\Web\Wallpaper\Windows\*.jpg
icacls C:\Windows\Web\Wallpaper\Windows\*.jpg /reset
takeown /f C:\Windows\Web\4K\Wallpaper\Windows\*.jpg
icacls C:\Windows\Web\4K\Wallpaper\Windows\*.jpg /reset
copy img100.jpg C:\Windows\Web\Screen\ /Y
copy img103.png C:\Windows\Web\Screen\ /Y
copy img0.jpg C:\Windows\Web\Wallpaper\Windows\ /Y
copy img0_*.jpg C:\Windows\Web\4K\Wallpaper\Windows\ /Y
copy *.bmp C:\Windows\Web\Wallpaper\Windows\ /Y
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d C:\Windows\Web\Wallpaper\Windows\ame_wallpaper_1440.bmp /f
start RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: Delete Cache
takeown /f C:\ProgramData\Microsoft\Windows\SystemData
icacls C:\ProgramData\Microsoft\Windows\SystemData /reset
takeown /f C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18
icacls C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18 /reset
takeown /f C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly
icacls C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly /reset
takeown /f C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\LockScreen_Z
icacls C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\LockScreen_Z /reset
takeown /f C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\LockScreen_Z\*.jpg
icacls C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\LockScreen_Z\*.jpg /reset
del C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\LockScreen_Z\*.jpg /f /q