# TekNite
## Diseño de una estrategia de monitoreo (IaaS)

En este TekNite se van a implementar 2 VM, con la aplicación `SmartHotel` de Microsoft, totalmente funcional. Una vez completado, podrá utilizar las IP públicas asignadas por la infraestructura de Azure para tener acceso a los recursos. 

### Pasos para la implementación:
- [x] Tarea 1: Implementación del ambiente de laboratorio.

![Diagrama](/Images/diagrama.png)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcrisrc012%2FTekNite%2Fmain%2FARM%2FSmartHotel%2FSmartHotel.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/></a>

> Nota: Puede tardar alrededor de 15 minutos, una vez finalizada la implementación se debe de reiniciar la máquina virtual `smarthotelsql`, desde el portal de Azure, para que finalice la configuración automática.
- [x] Tarea 2: Crear y configurar Azure Log Analytics Workspace.

1. En Azure portal, buscar y seleccionar `Log Analytics workspaces`, hacer click en `+ Create`.
2. En el formulario `Create Log Analytics workspace`, usar el `Resource Group` creado anteriormente, usar la misma región de los recursos creados anteriormente, elegir un nombre. Hacer clock en `Review + Create`.
3. En los recursos de máquina virtual, ir a la sección `Monitoring` y luego a la opción `Logs`, y hacer click en `Enable`. Seleccionar nuestra suscripción y el `Log Analitics Workspace` creado en el paso anterior. Hacerlo para ambas máquinas virtuales.

- [x] Tarea 3: Revisar la configuración de monitoreo por defecto de máquinas virtuales de Azure.
1. En los recursos de máquina virtual, ir a la sección `Monitoring` y luego a la opción `Metrics`.
2. verificar que `Metric Namespace` sea `Virtual Machine Host`, en `Metric`, el valor sea `Percentage CPU` y en `Aggrgation` sea `Avg`.
- [x] Tarea 4: Configurar el diagnóstico de máquinas virtuales de Azure.
1. En los recursos de máquina virtual, ir a la sección `Monitoring` y luego a la opción `Diagnostic settings`, y hacer click en `Enable guest-level monitoring`.
2. Ir a la pestaña `Performance counters` y revisar los contadores disponibles.
- [x] Tarea 5: Revisar las funcionalidad de Azure Monitor.
- [x] Tarea 6: Revisar las funcionalidad de Azure Log Analytics.





