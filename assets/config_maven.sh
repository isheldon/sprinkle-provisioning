#!/bin/bash

nexus_url=$1
mvn_home=/opt/apache-maven

mkdir /opt/maven_repo
chmod 777 /opt/maven_repo
mv $mvn_home/conf/settings.xml $mvn_home/conf/settings.xml.orig
mv /tmp/maven_settings.xml $mvn_home/conf/settings.xml.tmp
sed -e "s|NEXUS_URL|$nexus_url|g" $mvn_home/conf/settings.xml.tmp >> $mvn_home/conf/settings.xml
chmod 666 $mvn_home/conf/settings.xml

echo "maven configured"
echo "maven settings..."
cat $mvn_home/conf/settings.xml
echo "end maven settings"
