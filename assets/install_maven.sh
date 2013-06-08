#!/bin/bash

wget http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz -O /tmp/apache-maven.tar.gz
cd /opt
tar xzf /tpm/apache-maven.tar.gz
ln -s apache-maven-3.0.5 apache-maven
ln -s /opt/apache-maven/bin/mvn /usr/bin/mvn

