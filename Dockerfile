FROM java:openjdk-8-alpine

WORKDIR /usr/src/app
COPY ./target/*.jar ./app.jar

ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mongo:27017/data","-Djava.security.egd=file:/dev/urandom","-jar","./app.jar", "--port=80"]
