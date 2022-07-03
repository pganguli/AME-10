call PERM.bat
net user administrator /active:yes
net user Administrator malte
net localgroup administrators %username% /delete