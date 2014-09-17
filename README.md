# XCode bots + cocoapod



Configuration running: XCode 5.0 and OS X Server 3.0

### Server configuration

- Configure the Server under XCode's tab with the repository (including the SSH key), developers team access, ownerships, etc.

- Create home folder /var/teamsserver for _teamsserver user if it doesn’t already exist:

	$ sudo mkdir /var/teamsserver

Make sure to set proper ownerships on /var/teamsserver to _teamsserver account:
	
	$ sudo chown -R _teamsserver:_teamsserver /var/teamsserver/

	$ sudo chmod -R 770 /var/teamsserver/ 


### XCode configuration

- Make sure the sheme you want to test is shared.

- Edit your scheme, in the build tab uncheck Parallelize Build (sometimes it gives problems and stops your project) and Find Implicit Dependencies.

- Add the Pods target, and put it the first in the list.

- Under Pre-actions in the Build tab add the following script, and choose your project under Provide build settings from:

	cd $(SCRROOT)
	
	pod install


### Reference links:

http://bjmiller.me/post/72937258798/continuous-integration-with-xcode-5-xctest-os-x

https://github.com/CocoaPods/blog.cocoapods.org/blob/master/_drafts/CocoaPods-Bots.markdown

https://github.com/CocoaPods/blog.cocoapods.org/issues/21

### Notes

Every first build for a new bot is always a failure. The reason it doesn't work on clean installs is because the Pods.xcconfig file is not present when the workspace/project is initially loaded, so the various search paths and environment variables set there are missing initially.