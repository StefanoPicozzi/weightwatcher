#!/bin/sh 
DEMO="Install weightwatcher on BRMS"
AUTHORS="Stefano Picozzi"
PROJECT="git@github.com:https://github.com/StefanoPicozzi/weightwatcher.git"
PRODUCT="JBoss BRMS"
JBOSS_HOME=./target/jboss-eap-6.4
SERVER_DIR=$JBOSS_HOME/standalone/deployments
SERVER_CONF=$JBOSS_HOME/standalone/configuration/
SERVER_BIN=$JBOSS_HOME/bin
SRC_DIR=../installs
SUPPORT_DIR=./support
PRJ_DIR=./projects
BRMS=jboss-brms-6.1.0.GA-installer.jar
EAP=jboss-eap-6.4.0-installer.jar
VERSION=6.1

# Remove the old JBoss instance, if it exists.
if [ -x $JBOSS_HOME ]; then
		echo "  - removing existing JBoss product..."
		echo
		rm -rf $JBOSS_HOME
fi

# Run installers.
echo "JBoss EAP installer running now..."
echo
java -jar $SRC_DIR/$EAP $SUPPORT_DIR/installation-eap -variablefile $SUPPORT_DIR/installation-eap.variables
if [ $? -ne 0 ]; then
	echo
	echo Error occurred during JBoss EAP installation!
	exit
fi

echo
echo "JBoss BRMS installer running now..."
echo
java -jar $SRC_DIR/$BRMS $SUPPORT_DIR/installation-brms -variablefile $SUPPORT_DIR/installation-brms.variables
if [ $? -ne 0 ]; then
	echo
	echo Error occurred during $PRODUCT installation!
	exit
fi

# Run application defaults.
echo "Copying weightwatcher configuration files and settings"
echo
cp -r $SUPPORT_DIR/jboss-eap-6.4/ $JBOSS_HOME

echo "Setting up custom maven settings so KieScanner finds repo updates..."
echo
cp $SUPPORT_DIR/jboss-eap-6.4/repository/settings.xml.traditional $JBOSS_HOME/repository/.settings.xml

# Add execute permissions to the standalone.sh script.
echo "Making sure standalone.sh for server is executable..."
echo
chmod u+x $JBOSS_HOME/bin/standalone.sh

echo "You can now start the $PRODUCT with $SERVER_BIN/standalone.sh"
echo
echo "Login to http://localhost:8080/business-central   (u:spicozzi / p:jbossbrms1!)"
echo

echo "$PRODUCT $VERSION $DEMO Setup Complete."
echo


