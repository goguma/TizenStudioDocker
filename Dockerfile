FROM ubuntu:18.04
MAINTAINER SeongWon Cho <seongwon79@hanafos.com>

RUN apt-get update
RUN apt-get install -y sudo wget zip libwebkitgtk-1.0-0 libgtk2.0-0:amd64 libxtst6:amd64 rpm2cpio cpio cpio python2.7 gettext make libssl1.0.0

WORKDIR /opt

#install openjdk and openjfx
RUN wget https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_linux-x64_bin.tar.gz 
RUN tar zxvf openjdk-10.0.2_linux-x64_bin.tar.gz
RUN cd jdk-10.0.2
RUN JAVA_HOME=/opt/jdk-10.0.2/
RUN update-alternatives --install /usr/bin/java java /opt/jdk-10.0.2/bin/java 20000
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk-10.0.2/bin/javac 20000
RUN update-alternatives --config java
RUN update-alternatives --config javac
RUN java -version

WORKDIR /opt
RUN wget https://download2.gluonhq.com/openjfx/11.0.2/openjfx-11.0.2_linux-x64_bin-sdk.zip
RUN unzip openjfx-11.0.2_linux-x64_bin-sdk.zip
#RUN cd javafx-sdk-11.0.2
RUN cp -arf /opt/javafx-sdk-11.0.2/lib/* /opt/jdk-10.0.2/lib/


# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    mkdir -p /etc/sudoers.d && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
RUN cp /etc/skel/.bashrc /home/developer/
RUN wget http://download.tizen.org/sdk/Installer/tizen-studio_3.3/web-ide_Tizen_Studio_3.3_ubuntu-64.bin
RUN chmod a+x web-ide_Tizen_Studio_3.3_ubuntu-64.bin
RUN mkdir -p /home/developer/workspace
#CMD /home/developer/chmod a+x web-ide_Tizen_Studio_3.3_ubuntu-64.bin

