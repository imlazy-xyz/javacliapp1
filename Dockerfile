FROM 647980587564.dkr.ecr.us-east-1.amazonaws.com/openjdk:8-jdk-alpine
ARG JAR_FILE=target/find-links.jar
ARG JAR_LIB_FILE=target/lib/

RUN mvn clean package

RUN ls -R && date

# cd /usr/local/runme
WORKDIR /usr/local/runme

# cp target/app.jar /usr/local/runme/app.jar
COPY ${JAR_FILE} app.jar

# cp -rf target/lib/  /usr/local/runme/lib
ADD ${JAR_LIB_FILE} lib/

# java -jar /usr/local/runme/app.jar
ENTRYPOINT ["java","-jar","app.jar"]