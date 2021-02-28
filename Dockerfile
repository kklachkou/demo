FROM adoptopenjdk/openjdk11:jre-11.0.10_9-alpine
ENV MAX_HEAP=1g
ARG JAR_FILE=build/libs/demo*.jar
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
COPY ${JAR_FILE} /opt/app.jar
ENTRYPOINT exec java \
-Xmx${MAX_HEAP} \
-Djava.security.egd=file:/dev/./urandom \
#-Djava.rmi.server.logCalls=true \
#-Djava.rmi.server.hostname=127.0.0.1 \
#-Dcom.sun.management.jmxremote=true \
#-Dcom.sun.management.jmxremote.port=3333 \
#-Dcom.sun.management.jmxremote.rmi.port=3333 \
#-Dcom.sun.management.jmxremote.local.only=false \
#-Dcom.sun.management.jmxremote.authenticate=false \
#-Dcom.sun.management.jmxremote.ssl=false \
-jar /opt/app.jar
