Set-ExecutionPolicy RemoteSigned -Force -scope CurrentUser
iwr -useb get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -RunAsAdmin
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
scoop install git
scoop bucket add extras
scoop install windows-terminal