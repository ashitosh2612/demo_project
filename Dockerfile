FROM maven as build
WORKDIR /app
COPY . /app
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /demo-project/target/uber.jar /app/
EXPOSE 9090
CMD [ "java","jar","Uber.jar"  ]