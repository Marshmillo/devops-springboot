FROM openjdk:8-jdk-alpine
MAINTAINER jcamilodz@gmail.com
VOLUME /tmp
EXPOSE 8080
ADD build/libs/\*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]