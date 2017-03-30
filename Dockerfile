FROM jboss/base-jdk:8

ENV KEYCLOAK_VERSION 3.0.0.CR1

USER root
RUN yum install -y unzip wget && yum clean all

USER jboss

RUN cd /opt/jboss/ && \
    wget http://central.maven.org/maven2/org/keycloak/keycloak-proxy-dist/$KEYCLOAK_VERSION/keycloak-proxy-dist-$KEYCLOAK_VERSION.zip && \
    unzip keycloak-proxy-dist-$KEYCLOAK_VERSION.zip && mv /opt/jboss/keycloak-proxy-$KEYCLOAK_VERSION /opt/jboss/keycloak-proxy

EXPOSE 8080 8443

WORKDIR /opt/jboss/keycloak-proxy

CMD ["java", "-jar", "bin/launcher.jar", "/opt/jboss/keycloak-proxy-config/config.json"]
