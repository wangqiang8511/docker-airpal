FROM        ubuntu:14.04
MAINTAINER Wang Qiang <qiang.wang@razerzone.com>

# Last Package Update & Install
RUN apt-get update && apt-get install -y curl wget net-tools iputils-ping vim

# JDK
ENV JDK_URL http://download.oracle.com/otn-pub/java/jdk
ENV JDK_VER 8u51-b16
ENV JDK_VER2 jdk-8u51
ENV JAVA_HOME /usr/local/jdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN cd $SRC_DIR && curl -LO "$JDK_URL/$JDK_VER/$JDK_VER2-linux-x64.tar.gz" -H 'Cookie: oraclelicense=accept-securebackup-cookie' \
 && tar xzf $JDK_VER2-linux-x64.tar.gz && mv jdk1* $JAVA_HOME && rm -f $JDK_VER2-linux-x64.tar.gz \
 && echo '' >> /etc/profile \
 && echo '# JDK' >> /etc/profile \
 && echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile \
 && echo 'export PATH="$PATH:$JAVA_HOME/bin"' >> /etc/profile \
 && echo '' >> /etc/profile

# Install addtional package
RUN apt-get update && apt-get install -y git unzip python make g++

# Install gradle for build
ENV GRADLE_VERSION 2.6
ENV SRC_DIR /opt
ENV GRADLE_URL https://services.gradle.org/distributions
RUN cd $SRC_DIR \
 && wget ${GRADLE_URL}/gradle-${GRADLE_VERSION}-bin.zip \
 && unzip gradle-${GRADLE_VERSION}-bin.zip \
 && rm -rf gradle-${GRADLE_VERSION}-bin.zip

ENV GRADLE_HOME $SRC_DIR/gradle-${GRADLE_VERSION}
ENV PATH $PATH:$GRADLE_HOME/bin

# Build airpal
RUN cd $SRC_DIR \
 && git clone https://github.com/airbnb/airpal \
 && cd $SRC_DIR/airpal \
 && ./gradlew clean shadowJar

ENV AIRPAL_HOME $SRC_DIR/airpal

ADD conf/reference.yml $AIRPAL_HOME/reference.yml
ADD scripts /scripts
