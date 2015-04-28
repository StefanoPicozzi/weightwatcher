JBoss BRMS 6 weightwatcher Demo
===============================

weightwatcher is a stateless Decision Server based on JBoss BRMS 6.1. This project is to automate the deployment for both traditional and container based options.

Both options require a manual configuration step to create the kie-server. This will be automated once a REST API for kie-server instance creation is made available. Configure the server from the Deply tab of the workbench with settings such as:

Endpoint: http://localhost:8080/kie-server/

Name: weightwatcher

Username: spicozzi

Password: jbossbrms1!


Download and install the Soap-UI to try out the test suite of REST invocations located as a Soap-UI project in the test directory. Edit endpoints as necessary to reflect your installation.

Traditional Deployment
-----------------------

Download and unzip.

Add product installers to installs directory.

Run 'init.sh'.

Login to http://localhost:8080/business-central (u:spicozzi / p:jbossbrms1! )

Enjoy installed and configured JBoss BRMS 6.

Docker Deployment
-----------------

The following steps can be used to configure and run the demo in a docker container

Download and unzip.

Add product installers to installs directory.

Build demo image

docker build -t spicozzi/weightwatcher .

Start demo container

docker run -it -p 8080:8080 -p 9990:9990 spicozzi/weightwatcher

Login to http://<DOCKER_HOST>:8080/business-central (u:spicozzi / p:jbossbrms1! )

Enjoy installed and configured JBoss BRMS 6.

If using boot2docker locate your instance IP address using:

$ boot2docker ip

Supporting Articles

http://blog.emergitect.com/2014/12/08/really-simple-rules-service/


