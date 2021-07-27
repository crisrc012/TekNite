# Instalar Dependencias
Get-WindowsFeature -Name "Web-*" | Install-WindowsFeature

# Se elimina el sitio por defecto
Remove-Website -Name "Default Web Site" 

# Descargar los recursos
Invoke-WebRequest -Uri https://github.com/crisrc012/TekNite/archive/refs/heads/main.zip -OutFile C:\main.zip
# Descomprimir recursos
Expand-Archive -LiteralPath C:\main.zip -DestinationPath C:\
# Mover el contenido de la app y Wcf
Move-Item C:\TekNite-main\ARM\SmartHotel\SmartHotel.* -Destination C:\inetpub\

# Crear nuevos sitios
New-Website -Name "SmartHotel.Registration" -Port 80 -PhysicalPath "C:\inetpub\SmartHotel.Registration"
New-Website -Name "SmartHotel.Registration.Wcf" -Port 2901 -PhysicalPath "C:\inetpub\SmartHotel.Registration.Wcf"