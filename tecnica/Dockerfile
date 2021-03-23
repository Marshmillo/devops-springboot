FROM openjdk:8-jdk-alpine
MAINTAINER jcamilodz@gmail.com
VOLUME /tmp
EXPOSE 8080
ADD build/libs/\*.jar app.jar
#ADD demoBack-0.0.1-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]