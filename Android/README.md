## Android, Configuración básica Jenkins:

### Plugins necesarios:

- Git Plugin
- Cucumber json test reporting

### Configurar el sistema:


#### Jenkins location:

**Jenkins URL**: dns del server o ip en caso de no tener dns. En nuestro caso es: osxserver.local:8080

#### Notificación por correo electrónico:

Configura todos los datos para que el servidor sea capaz de enviar emails cuando falle una tarea.

Ejemplo:

SMTP: smtp.gmail.com
Usar seguridad SSL: sí
Puerto SMTP: 465
	
## Calabash

Instalar bundle, rake, cucumber y calabash iOS en la máquina servidora:

	sudo gem install bundle
	sudo gem install rake
	sudo gem install cucumber
	sudo gem install calabash-cucumber
	
En la tarea del jenkins debemos ejecutar una línea de comandos shell con lo siguiente:	
	
	export LC_ALL="en_US.UTF-8"
	
	cucumber JenkinsTestTests --format json --out report.json

La primera línea es porque cucumber tiene que ser ejecutados bajo UTF8.

En la última línea le especificamos, primero que ejecutamos los tests, le indicamos la carpeta donde se encuentra la carpeta de features, después le indicamos el formato de los resultados y que lo imprima a un fichero.

Posteriormente agregamos en la tarea de Jenkins una "acción para ejecutar después" de tipo "Cucumber json test reporting", que transformará el fichero de json en datos de tests leibles por Jenkins.

Como paso adicional podemos agregar otra acción para que envíe un email en caso de que los tests fallen.