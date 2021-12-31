FROM centos

# Installing the sources for the locales, git, and Xvfb
RUN dnf -y install git Xvfb glibc-locale-source

# Setting up the default locale to en_US.UTF-8
RUN localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8 && export LANG=en_US.UTF-8

# Installing Necessary packages including firefox
RUN dnf -y install dbus-x11 PackageKit-gtk3-module libcanberra-gtk2 firefox

# Generating a universally unique ID for the Container
RUN  dbus-uuidgen > /etc/machine-id


RUN mkdir /root/setup

WORKDIR /root/setup

RUN git clone https://github.com/iliaamiri/selenium-setup-on-Linux-dependencies-for-Docker.git

WORKDIR /root/setup/selenium-setup-on-Linux-dependencies-for-Docker

RUN chmod a+x START.sh

RUN mv geckodriver /usr/local/bin/geckodriver
RUN chmod 777 /usr/local/bin/geckodriver

RUN mkdir /usr/bin/java
RUN mv jre-8u311-linux-x64.tar.gz /usr/bin/java

WORKDIR /usr/bin/java

RUN tar zxvf jre-8u311-linux-x64.tar.gz
RUN rm jre-8u311-linux-x64.tar.gz


RUN echo "PATH=$PATH:$HOME/bin:/usr/bin/java/jre1.8.0_311/bin" >> /root/.bash_profile
RUN echo "export PATH" >> /root/.bash_profile

WORKDIR /root

RUN echo 'if [ -f ~/.bashrc ]; then' > .bash_profile
RUN echo '. ~/.bashrc' >> .bash_profile
RUN echo 'fi' >> .bash_profile
RUN echo 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/bin:/usr/bin/java/jre1.8.0_311/bin' >> .bash_profile
RUN echo 'export PATH' >> .bash_profile

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/bin:/usr/bin/java/jre1.8.0_311/bin"

ENV DISPLAY=$DISPLAY

WORKDIR /root/setup/selenium-setup-on-Linux-dependencies-for-Docker


CMD ["/bin/bash", "/root/setup/selenium-setup-on-Linux-dependencies-for-Docker/START.sh"]