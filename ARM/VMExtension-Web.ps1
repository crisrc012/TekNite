# Instalar IIS
Install-WindowsFeature -name Web-Server –IncludeManagementTools

# Crear Sitio
#Remove-Item -Path C:\inetpub\wwwroot\* -Recurse -Force
# Descargar el sitio clon de conzultek.com/contactenos
#Invoke-WebRequest -Uri https://github.com/crisrc012/TekNite/archive/main.zip -OutFile C:\main.zip
# Descomprimir el sitio
#Expand-Archive -LiteralPath C:\main.zip -DestinationPath C:\
# Mover el contenido del sitio a la raiz del sitio por defecto de IIS
#Move-Item C:\TekNite-main\site\wvw.conzultek.com\* -Destination C:\inetpub\wwwroot\
