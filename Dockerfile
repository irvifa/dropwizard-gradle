FROM java:8
MAINTAINER Irvi Firqotul Aini <irvi.aini@traveloka.com>

# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive

# Init system version
ARG TINI_VERSION=v0.16.1

ENV HELLO_USER hello
ENV HELLO_HOME /home/hello
ENV TINI ${HELLO_HOME}/tini

RUN useradd -ms /bin/bash ${HELLO_USER}

# Add init system
ADD https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini ${HELLO_HOME}
COPY build/libs/dropwizard-gradle-1.0-SNAPSHOT-all.jar ${HELLO_HOME}
COPY hello-world.yml ${HELLO_HOME}
EXPOSE 8080
EXPOSE 8081

RUN chmod 700 ${HELLO_HOME}/tini
RUN chown -R ${HELLO_USER}:${HELLO_USER} ${HELLO_HOME}
USER ${HELLO_USER}
WORKDIR ${HELLO_HOME}

ENTRYPOINT ["/home/hello/tini", "--"] 
CMD ["java","-jar","dropwizard-gradle-1.0-SNAPSHOT-all.jar","server","hello-world.yml"]
