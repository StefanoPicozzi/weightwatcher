JBoss BRMS 6 weightwatcher Demo
===============================

weightwatcher is a demonstration application of a stateless Decision Server based on JBoss BRMS 6.1 and includes support for complex event processing (CEP) use cases based on a pseudo clock.  

Examples provided include a (REST) client sending a time series of facts in the form of weight observations to the Decision Server.  The Decision Server then reasons over the inputs to derive CEP insights such as average weight, least weight and weight change of a rolling time window. These insights are returned to the calling client as facts.

This project provides instructions to automate the deployment for both traditional and container based options. Instalation instructions for OpenShift V3 will be added later in H1, 2016.  To inspect, clone this repository and review the documentation in the docs directory, summarised as follows.

Traditional Deployment
-----------------------

Clone this repository.

Add product installers to installs directory.

Run 'init.sh'.

Login to http://localhost:8080/business-central (u:erics / p:jbossbrms1! )

Follow the quick start guide.

Enjoy installed and configured JBoss BRMS 6.

Container Deployment
--------------------

The following steps can be used to configure and run the demo in a docker container

Clone this repository.

Add runtime zip file to installs directory.

Build demo image

docker build -t spicozzi/weightwatcher .

Start demo container

docker run -it -p 8080:8080 -p 9990:9990 spicozzi/weightwatcher

Login to http://CONTAINER_HOST:8080/business-central (u:erics / p:jbossbrms1! )

Follow the quick start guide from section 2.

Enjoy installed and configured JBoss BRMS 6.

If using boot2docker locate your instance IP address using:

$ boot2docker ip

To run multiple demo comtainers on the same host:

docker run -it -p 8080:8080 -p 9090:9090 spicozzi/weightwatcher

Login to http://CONTAINER_HOST:8080/business-central (u:erics / p:jbossbrms1! )

Supporting Articles
-------------------
http://blog.emergitect.com/2015/05/09/weightwatcher/

http://blog.emergitect.com/2014/12/08/really-simple-rules-service/

To Do
-----

* Convert to maven project so that build is automated
* Move repository to externally mountable volume
* Guided decision table alternative to GAS scoring
* Add demo section describing test cases for REST Mgmt API samples
* Add Decision Server container to a public repository
* Redesign heartbeat.sh as container service
* OpenShift V3 deployment instructions
