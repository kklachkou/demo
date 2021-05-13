#FROM adoptopenjdk/openjdk11:jre-11.0.10_9-alpine
FROM openjdk:8u171-jre-alpine
ARG JAR_FILE=build/libs/demo*.jar
COPY ${JAR_FILE} /opt/app.jar

ENTRYPOINT exec java $JAVA_OPTS -jar /opt/app.jar

