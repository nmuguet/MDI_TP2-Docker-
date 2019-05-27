FROM debian:stretch

# VOLUME /ESIRTPDockerSampleApp
#VOLUME /opencv

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y git build-essential cmake software-properties-common dirmngr python-dev python-numpy 

#RUN apt-get install  &&\
#    apt-get install libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev &&\
#    apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev


# RUN add-apt-repository ppa:webupd8team/java && add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu yakkety main" && apt-get update && echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && apt-get -y install oracle-java8-installer


# Install OpenJDK-8 and ant
RUN apt-get install -y openjdk-8-jdk java-wrappers junit && \
    apt-get install -y ant maven 

# Fix certificate issues
#RUN apt-get update && \
#    apt-get install ca-certificates-java && \
#    apt-get clean && \
#    update-ca-certificates -f;


# Import the project
RUN git clone https://github.com/barais/ESIRTPDockerSampleApp

# install openCV
RUN cd /home && \
    mkdir barais && \
    cd ./barais && \
    mkdir git && \
    cd ./git && \
    git clone -b 3.4 https://github.com/opencv/opencv && \
    cd /home/barais/git/opencv && \
    mkdir build && \
    cd build && \
    cmake -D BUILD_SHARED_LIBS=OFF .. && \
    make -j8 && mvn install:install-file -Dfile=./bin/opencv-346.jar -DgroupId=org.opencv -DartifactId=opencv -Dversion=3.4.6 -Dpackaging=jar



RUN cd /ESIRTPDockerSampleApp && \
    mvn package

RUN cd /ESIRTPDockerSampleApp && \
    cp -r target /home/barais/git/opencv



