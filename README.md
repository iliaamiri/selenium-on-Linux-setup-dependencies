# Selenium Standalone Setup on CentOS 7 - Docker Image
An easy and quick way to setup a Selenium Standalone Server up and running and keep your time and energy on your main project's goals.

*Note: This only works fine on a Linux Docker Host! I'm working on it to make it possible to run on a Windows Docker Host.*
**Although, you can still use these dependencies regardless of using Docker. However, you need to setup the Selenium required environment on your own, and it will be different depending on your machine and network settings.**

## Setup
 ```
docker pull redbolder/selenium_standalone_on_centos_7
 
docker run -it -p <YOUR HOST PORT>:4444 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix redbolder/selenium_standalone_on_centos_7
 ```
   - `<YOUR HOST PORT>`: Can be replaced by a port number (e.g. 4444, ..).

- https://guacamole.apache.org/releases/0.9.7/ 
