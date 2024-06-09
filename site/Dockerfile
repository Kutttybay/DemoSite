FROM openjdk:8

RUN groupadd -r solr && useradd --no-log-init -r -g solr solr

WORKDIR /app
COPY target/ROOT.jar .
COPY target/agents/spring-instrument.jar .

RUN chown -R solr:solr /app

EXPOSE 8080
EXPOSE 8443

USER solr

CMD ["java", "-javaagent:spring-instrument.jar", "-jar", "ROOT.jar"]
