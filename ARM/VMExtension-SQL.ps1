# Se establece el protocolo TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
# Se establece la preferencia en error
$ErrorActionPreference = 'SilentlyContinue'

# Se descarga el Script de SQL
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/crisrc012/TekNite/main/ARM/SmartHotel/scriptSmartHotel.sql" -OutFile C:\scriptSmartHotel.sql

# Se usa para validar que esté disponible el SQL
while($true) {
    Start-Sleep -Seconds 3
    if(Get-Service -Name MSSQLSERVER) {
        Start-Sleep -Seconds 60
        Get-Service -Name MSSQLSERVER
        # Se habilitar el modo de Login Mixto
        Set-ItemProperty -Path "HKLM:\Software\Microsoft\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQLServer" -Name "LoginMode" -Value 2 -Force

        # Se ejecuta el Script
        Invoke-Sqlcmd -ServerInstance $env:ComputerName -InputFile C:\scriptSmartHotel.sql

        # Se reinicia el servicio
        Restart-Service -Name MSSQLSERVER -Force
        
        # Una vez completado se sale sin error
        return 0
    }
}
