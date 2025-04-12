# Description: Dockerfile for Spring Boot application
# Author: Juan Sebastián Gámez Ariza

# Set the base image to use for the container
FROM amazoncorretto:17-alpine3.21-jdk

# Set working directory
WORKDIR /spring_boot_app

# Copy the jar file from the target directory to the container
COPY ./target/unBook-0.0.1-SNAPSHOT.jar /spring_boot_app

# Expose the port that the application will run on
EXPOSE 8080

CMD ["java", "-jar", "/spring_boot_app/unBook-0.0.1-SNAPSHOT.jar"]
