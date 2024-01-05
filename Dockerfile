FROM 647980587564.dkr.ecr.us-east-1.amazonaws.com/openjdk:8-jdk-alpine
ARG JAR_FILE=target/find-links.jar
ARG JAR_LIB_FILE=target/lib/

RUN mvn package

RUN echo "" && ls -R

# cd /usr/local/runme
WORKDIR /usr/local/runme

# cp target/app.jar /usr/local/runme/app.jar
COPY target/find-links.jar app.jar

# cp -rf target/lib/  /usr/local/runme/lib
ADD target/lib/ lib/

# java -jar /usr/local/runme/app.jar
ENTRYPOINT ["java","-jar","app.jar"]