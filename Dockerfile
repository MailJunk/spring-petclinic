# Stage 1: Build Stage 
FROM openjdk:8-jdk-alpine AS build
WORKDIR /app
COPY .mvn/ .mvn
COPY pom.xml pom.xml
mvn dependency:go-offline
COPY src src
mvn package

# Stage 2: Final Image
FROM openjdk:8-jdk-alpine 
WORKDIR /app
COPY --from=build /app/target/spring-petclinic-*.jar . 
EXPOSE 8080
CMD ["java","-jar","spring-petclinic-*.jar"]