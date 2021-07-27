# Se establece el protocolo TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Se descarga el Script de SQL
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/crisrc012/TekNite/main/ARM/SmartHotel/scriptSmartHotel.sql" -OutFile C:\scriptSmartHotel.sql

# Se habilitar el modo de Login Mixto
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQLServer" -Name "LoginMode" -Value 2 -Force

# Se ejecuta el Script en el siguiente login
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce" -Name "SQL" -Value 'powershell -ExecutionPolicy Unrestricted -command "Invoke-Sqlcmd -ServerInstance $env:ComputerName -InputFile C:\scriptSmartHotel.sql"' -Force

# Se habilita Autologon
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultUserName" -Value "demouser" -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -Value 1 -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultPassword" -Value "demo!pass123" -Force
