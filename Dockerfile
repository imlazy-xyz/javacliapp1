# Use the official Ubuntu as the base image
FROM ubuntu:latest

# Copy your project files into the container at /app
# COPY java-webapp/ app/

# Run any essential commands to build your project
RUN apt-get update && \
    apt-get install -y maven && \
    # cd app && \
    mvn clean package
