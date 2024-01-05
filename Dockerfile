From maven:3.3-jdk-8 as build
# ARG JAR_FILE=target/find-links.jar
# ARG JAR_LIB_FILE=target/lib/

COPY pom.xml .
COPY src ./src

RUN mvn package

FROM 647980587564.dkr.ecr.us-east-1.amazonaws.com/openjdk:8-jdk-alpine
# FROM openjdk:8-jdk-alpine

# cd /usr/local/runme
WORKDIR /usr/local/runme

# cp target/app.jar /usr/local/runme/app.jar
COPY --from=build target/find-links.jar app.jar

# cp -rf target/lib/  /usr/local/runme/lib
COPY --from=build target/lib/ lib/

# java -jar /usr/local/runme/app.jar
ENTRYPOINT ["java","-jar","app.jar"]