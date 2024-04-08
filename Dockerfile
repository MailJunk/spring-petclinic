FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY .mvn/ .mvn
COPY pom.xml pom.xml
RUN mvn dependency:go-offline
COPY src src
RUN mvn package

EXPOSE 8080
CMD ["java","-jar","target/spring-petclinic-*.jar"]