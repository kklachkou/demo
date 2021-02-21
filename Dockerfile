FROM adoptopenjdk/openjdk11:jre-11.0.10_9-alpine
ENV MAX_HEAP=768m
ARG JAR_FILE=build/libs/demo*.jar
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
COPY ${JAR_FILE} /opt/app.jar
ENTRYPOINT exec java \
-Xmx${MAX_HEAP} \
-Djava.security.egd=file:/dev/./urandom \
-jar /opt/app.jar
