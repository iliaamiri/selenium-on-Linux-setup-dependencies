# Selenium Standalone Setup on CentOS 7 - Docker Image
An easy and quick way to setup a Selenium Standalone Server up and running and keep your time and energy on your main project's goals.

## Setup

*Note that for Windows being your Docker host, you need to install VcXsrv and configure it. Refer to [this link](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde) and under the (Install VcXsrv and configure it) section, follow the steps.*

 ```
docker pull redbolder/selenium_standalone_firefox_centos

# For Linux Hosts
docker run -it -p <YOUR HOST PORT>:4444 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix redbolder/selenium_standalone_firefox_centos

# For Windows Hosts
docker run -it -p <YOUR HOST PORT>:4444 -e DISPLAY=<YOUR HOST IP ADDRESS>:0.0 -v c:/tmp/X11-unix:/tmp/.X11-unix redbolder/selenium_standalone_firefox_centos
 ```
- Replace the `<YOUR HOST IP ADDRESS>` with your ip that you can find using `ipconfig` output from your command prompt.
- Replace the `<YOUR HOST PORT>` with an unused port that (e.g: 4444, 4445).

- https://guacamole.apache.org/releases/0.9.7/ 
