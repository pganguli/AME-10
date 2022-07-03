$a = (New-Object -comObject Shell.Application).Windows() |
 ? { $_.FullName -ne $null} |
 ? { $_.FullName.toLower().Endswith('\explorer.exe') } 

 $a | % {  $_.Quit() }