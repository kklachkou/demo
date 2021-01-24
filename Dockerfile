FROM adoptopenjdk:11-jre-hotspot
RUN mkdir /opt/app
COPY build/libs/demo*.jar /opt/app/app.jar
ENTRYPOINT exec java -Djava.rmi.server.logCalls=true -Djava.rmi.server.hostname=localhost -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=3333 -Dcom.sun.management.jmxremote.rmi.port=3333 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -jar /opt/app/app.jar