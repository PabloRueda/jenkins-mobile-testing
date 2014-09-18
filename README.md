# Test project for Jenkins

## OCUnit tests:

Soportado por el plugin de Jenkins de XCode, pero como OCUnit está en desuso no lo explico.

## XCTests:

El plugin de XCode de Jenkins no lo soporta todavía (17-10-2014), por lo que debemos ejecutar una línea de comandos shell usando **xcodebuild** o **xctool**.

Ejemplo:

	xcodebuild test -project JenkinsTest.xcodeproj -scheme "JenkinsTest" -destination "platform=iOS Simulator,name=iPhone Retina (3.5-inch),OS=7.1"

#### xcodebuild explanation:

destination: {name} es el nombre tal cual aparece en el desplegable de XCode

Links: 

https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/xcodebuild.1.html

https://developer.apple.com/library/prerelease/ios/documentation/DeveloperTools/Conceptual/testing_with_xcode/A2-command_line_testing/A2-command_line_testing.html

#### Resultados de los tests:

Para poder ver el resultado de los tests en nuestra tarea (job) debemos agregar una "acción para ejecutar después" de tipo "publicar los resultados de tests JUnit". Y la ruta de los ficheros esccribir **test-reports/*.xml**

Lo normal es que te salga un mensaje de warning indicando que no existe ese fichero, es normal ya que todavía no hemos lanzado la tarea.

Para poder generar el fichero xml con los resultados de los tests deberemos usar el script ocunit2junit (https://github.com/ciryon/OCUnit2JUnit). 

Para instalarlo simplemente escribiremos en consola: **gem install ocunit2junit**

Lo ejecutaremos en nuestro build step, para ello añadiremos | ocunit2junit al final de nuestra línea de xcodebuild. Ejemplo:

	xcodebuild test -project JenkinsTest.xcodeproj -scheme "JenkinsTest" -destination "platform=iOS Simulator,name=iPhone Retina (3.5-inch),OS=7.1" | ocunit2junit

