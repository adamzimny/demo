FROM java:8-jdk
#delete vim before going into production
EXPOSE 5000/tcp
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "less"]
RUN mkdir /app
WORKDIR /app
COPY target/continuousdelivery-java-reference.jar /app/
ENTRYPOINT ["java", "-jar", "/app/continuousdelivery-java-reference.jar"]
