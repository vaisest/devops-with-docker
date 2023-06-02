FROM eclipse-temurin:8-jdk-alpine AS build

WORKDIR /usr/src/app

COPY spring-example-project .

RUN ./mvnw package

FROM eclipse-temurin:8-jre-alpine

WORKDIR /app
COPY --from=build /usr/src/app/target .

RUN addgroup app && adduser app --disabled-password --ingroup app && chown -R app:app .
USER app

ENTRYPOINT java -jar ./docker-example-1.1.3.jar

EXPOSE 8080
