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
3. En los recursos de máquina virtual, ir a la sección `Monitoring` y luego a la opción `Logs`, y hacer click en `Enable`. Seleccionar nuestra suscripción y el `Log Analitics Workspace` creado en el paso anterior.
4. Hacerlo para ambas máquinas virtuales.

- [x] Tarea 3: Revisar la configuración de monitoreo por defecto de máquinas virtuales de Azure.
1. En los recursos de máquina virtual, ir a la sección `Monitoring` y luego a la opción `Metrics`.
2. Verificar que `Metric Namespace` sea `Virtual Machine Host`, en `Metric`, el valor sea `Percentage CPU` y en `Aggregation` sea `Avg`.
- [x] Tarea 4: Configurar el diagnóstico de máquinas virtuales de Azure.
1. En los recursos de máquina virtual, ir a la sección `Monitoring` y luego a la opción `Diagnostic settings`, y hacer click en `Enable guest-level monitoring`.
2. Ir a la pestaña `Performance counters` y revisar los contadores disponibles.
3. Ir a la pestaña `Logs` y revisar los registro de eventos disponibles para recolección.
4. En los recursos de máquina virtual, ir a la sección `Monitoring` y luego a la opción `Metrics`, en `Metric Namespace`, click en `Enable new guest memory metrics`.
5. Verificar que `Metric Namespace` sea `Guest (classic)`, en `Metric`, el valor sea `Percentage CPU` y en `Aggregation` sea `Max`.
6. Hacerlo para ambas máquinas virtuales.
- [x] Tarea 5: Revisar las funcionalidad de Azure Monitor.
1. En Azure portal, buscar y seleccionar `Monitor`.
2. Hacer click en `Metrics`, seleccionar el `Resource Group`, y luego elegir un ámbito, en `Resource type`, seleccionar `Virtual Machines`.
3. Verificar que `Metric Namespace` sea `Virtual Machine Host`, en `Metric`, el valor sea `Percentage CPU` y en `Aggregation` sea `Avg`.
4. Sobre el gráfico seleccionar `New alert rule`. En `Scope`, seleccionar ambas máquinas virtuales. Editar la condición exitente con estos datos en `Alert Logic`:

- Threshold: Static

- Operator: Greater than

- Aggregation type: Average

- Threshold value: 2

- Aggregation granularity (Period): 1 minute

- Frequency of evaluation: Every 1 Minute
5. Click en `Done`.
6. En el menu `Alert rule details`. Definir `CPU Alert` como nombre a la regla, hacer click en `Create alert rule`.
7. Entrar a ambas máquinas virtuales vía RDP y ejecutar en `CMD`, `for /l %a in (0,0,1) do echo a`, para elevar el uso de CPU.

- [x] Tarea 6: Revisar las funcionalidad de Azure Log Analytics.
1. Revisar las consultas disponibles.
