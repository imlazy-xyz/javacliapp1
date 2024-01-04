# Use the official Ubuntu as the base image
FROM ubuntu:latest

# Copy your project files into the container at /app
COPY src app/src
COPY pom.xml README.md app/

RUN cd app && pwd && ls

# Run any essential commands to build your project
RUN apt-get update && \
    apt-get install -y maven

RUN mvn -f /app/pom.xml clean package
