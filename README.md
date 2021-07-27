# TekNite
## Diseño de una estrategia de monitoreo (IaaS)

En este TekNite se van a implementar 2 VM, con la aplicación `SmartHotel` de Microsoft, totalmente funcional. Una vez completado, podrá utilizar las IP públicas asignadas por la infraestructura de Azure para tener acceso a los recursos. 

### Pasos para la implementación:
- [x] Tarea 1: Implementación del ambiente de laboratorio

![Diagrama](/Images/diagrama.png)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcrisrc012%2FTekNite%2Fmain%2FARM%2FSmartHotel%2FSmartHotel.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/></a>

> Nota: Puede tardar alrededor de 15 minutos, una vez finalizada la implementación se debe de reiniciar la máquina virtual `smarthotelsql`, desde el portal de Azure, para que finalice la configuración automática.
- [x] Tarea 2: Crear y configurar Azure Log Analytics Workspace

1. En Azure portal, buscar y seleccionar `Log Analytics workspaces`, en el menú `Log Analytics workspaces`, click `+ Add`.

2. En la pestaña `Basics` the Create Log Analytics workspace blade, the following settings, click Review + Create and then click Create:

- [x] Tarea 3: Revisar la configuración de monitoreo por defecto de máquinas virtuales de Azure
- [x] Tarea 4: Configurar la configuración de diagnóstico de máquinas virtuales de Azure
- [x] Tarea 5: Revisar las funcionalidad de Azure Monitor
- [x] Tarea 6: Revisar las funcionalidad de Azure Log Analytics





