# primera fase: entorno compilacion
FROM maven:3.5.0-jdk-8-alpine AS builder
ADD ./pom.xml pom.xml
ADD ./src src/
# package jar
RUN mvn clean verify

# segunda fase: entorno ejecución
FROM openjdk:8-jre-alpine
# copiar jar de primera fase
COPY --from=builder target/words.jar words.jar

EXPOSE 8080

CMD ["java", "-jar", "words.jar"]