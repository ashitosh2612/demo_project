FROM maven as build
WORKDIR /app
COPY . /app
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /app/target/uber.jar /app/
EXPOSE 9090
ENTRYPOINT [ "java","jar","Uber.jar" ]