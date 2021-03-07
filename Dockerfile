FROM openjdk:8u171-jre-alpine
ARG JAR_FILE=build/libs/demo*.jar
COPY ${JAR_FILE} /opt/app.jar

ENTRYPOINT exec java $JAVA_OPTS -jar /opt/app.jar

#-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
