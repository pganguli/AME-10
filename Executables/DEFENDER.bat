cd Executables
start /b /wait install_wim_tweak.exe /o /l
start /b /wait install_wim_tweak.exe /o /c "Windows-Defender" /r
start /b /wait install_wim_tweak.exe /h /o /l
start /b /wait winmgmt /resetrepository
shutdown /r /f /t 0