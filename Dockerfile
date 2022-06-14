FROM java:openjdk-8-alpine

WORKDIR /usr/src/app
COPY ./target/*.jar ./app.jar
EXPOSE 8081
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","./app.jar"]
