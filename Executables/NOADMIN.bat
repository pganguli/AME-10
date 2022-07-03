cd Executables
schtasks /create /xml AME-Log-off-admin.xml /tn "AME Log-off admin" /ru administrator /it
schtasks /create /xml AME-Log-off-admin-message.xml /tn "AME Log-off admin message" /ru administrator /it