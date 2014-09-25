# Configuración básica Jenkins:

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

# iOS

## OCUnit tests:

Soportado por el plugin de Jenkins de XCode, pero como OCUnit está en desuso no lo explico.

## XCTests:

El plugin de XCode de Jenkins no lo soporta todavía (17-10-2014), por lo que debemos ejecutar una línea de comandos shell usando **xcodebuild** o **xctool**.

Ejemplo:

	xcodebuild test -project JenkinsTest.xcodeproj -scheme "JenkinsTest" -destination "platform=iOS Simulator,name=iPhone Retina (3.5-inch),OS=7.1"

#### xcodebuild explanation:

destination: {name} es el nombre tal cual aparece en el desplegable de XCode

###### Links: 

https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/xcodebuild.1.html

https://developer.apple.com/library/prerelease/ios/documentation/DeveloperTools/Conceptual/testing_with_xcode/A2-command_line_testing/A2-command_line_testing.html

#### Resultados de los tests:

Para poder ver el resultado de los tests en nuestra tarea (job) debemos agregar una "acción para ejecutar después" de tipo "publicar los resultados de tests JUnit". Y la ruta de los ficheros esccribir **test-reports/*.xml**

Lo normal es que te salga un mensaje de warning indicando que no existe ese fichero, es normal ya que todavía no hemos lanzado la tarea.

Para poder generar el fichero xml con los resultados de los tests deberemos usar el script ocunit2junit (https://github.com/ciryon/OCUnit2JUnit). 

Para instalarlo simplemente escribiremos en consola: **gem install ocunit2junit**

Lo ejecutaremos en nuestro build step, para ello añadiremos | ocunit2junit al final de nuestra línea de xcodebuild. Ejemplo:

	xcodebuild test -project JenkinsTest.xcodeproj -scheme "JenkinsTest" -destination "platform=iOS Simulator,name=iPhone Retina (3.5-inch),OS=7.1" | ocunit2junit
	
Como paso adicional podemos agregar otra acción para que envíe un email en caso de que los tests fallen.

## CocoaPods:

Suponiendo que esté instalado la gema de cocoapods en la máquina servidora, simplemente agregar en la línea de comandos antes de ejecutar el build de xcode el siguiente comando:

	pod install
	
## Calabash

Instalar bundle, rake, cucumber y calabash iOS en la máquina servidora:

	sudo gem install bundle
	sudo gem install rake
	sudo gem install cucumber
	sudo gem install calabash-cucumber
	
En la tarea del jenkins debemos ejecutar una línea de comandos shell con lo siguiente:	
	
	export LC_ALL="en_US.UTF-8"
	
	pod install
	
	xcodebuild -workspace JenkinsTest.xcworkspace -scheme "JenkinsTest-cal" -destination "platform=iOS Simulator,name=iPhone Retina (3.5-inch),OS=7.1"
	
	cucumber JenkinsTestTests --format json --out report.json

La primera línea es porque tanto Cocoapods como cucumber tienen que ser ejecutados bajo UTF8.

En la última línea le especificamos, primero que ejecutamos los tests, le indicamos la carpeta donde se encuentra la carpeta de features, después le indicamos el formato de los resultados y que lo imprima a un fichero.

Posteriormente agregamos en la tarea de Jenkins una "acción para ejecutar después" de tipo "Cucumber json test reporting", que transformará el fichero de json en datos de tests leibles por Jenkins.

Como paso adicional podemos agregar otra acción para que envíe un email en caso de que los tests fallen.

# Android