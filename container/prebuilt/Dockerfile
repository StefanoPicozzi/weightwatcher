# Use jbossdemocentral/developer as the base
FROM jbossdemocentral/developer

# Maintainer details
MAINTAINER Stefano Picozzi <spicozzi@redhat.com>

# Environment Variables 
ENV BRMS_HOME /opt/jboss/brms/jboss-eap-6.4
ENV BRMS_VERSION_MAJOR 6
ENV BRMS_VERSION_MINOR 1
ENV BRMS_VERSION_MICRO 0
ENV BRMS_VERSION_BUILD GA

ENV EAP_VERSION_MAJOR 6
ENV EAP_VERSION_MINOR 4
ENV EAP_VERSION_MICRO 0

# Swtich back to root user to perform cleanup
USER root

# Apply the prebuilt option
COPY weightwatcher.zip /opt/jboss/brms/weightwatcher.zip
RUN unzip /opt/jboss/brms/weightwatcher.zip -d /opt/jboss/brms/
COPY support/jboss-eap-6.4/repository/settings.xml.docker $BRMS_HOME/repository/.settings.xml

# Fix permissions on support files
RUN chown -R jboss:jboss $BRMS_HOME

# Run as JBoss 
USER jboss

# Expose Ports
EXPOSE 9990 9999 8080

# Run BRMS
CMD ["/opt/jboss/brms/jboss-eap-6.4/bin/standalone.sh","-c","standalone.xml","-b", "0.0.0.0","-bmanagement","0.0.0.0"]
