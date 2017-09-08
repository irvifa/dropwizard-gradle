FROM java:8
COPY build/libs/dropwizard-gradle-1.0-SNAPSHOT-all.jar /opt/dropwizard/
COPY hello-world.yml /opt/dropwizard/
EXPOSE 8080
EXPOSE 8081
CMD ["java","-jar","/opt/dropwizard/dropwizard-gradle-1.0-SNAPSHOT-all.jar","server","/opt/dropwizard/hello-world.yml"]
