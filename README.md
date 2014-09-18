# Test project for Jenkins

### OCUnit tests:

Soportado por el plugin de Jenkins de XCode, pero como OCUnit está en desuso no lo explico.

### XCTests:

El plugin de XCode de Jenkins no lo soporta todavía (17-10-2014), por lo que debemos ejecutar una línea de comandos shell usando **xcodebuild** o **xctool**.

Ejemplo:

	xcodebuild test -project JenkinsTest.xcodeproj -scheme "JenkinsTest" -destination "platform=iOS Simulator,name=iPhone Retina (3.5-inch),OS=7.1"

#### xcodebuild explanation:

destination: {name} es el nombre tal cual aparece en el desplegable de XCode

Links: 

https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/xcodebuild.1.html

https://developer.apple.com/library/prerelease/ios/documentation/DeveloperTools/Conceptual/testing_with_xcode/A2-command_line_testing/A2-command_line_testing.html

