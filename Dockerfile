# Get the `openjdk` baseimage, with the tag `8-jdk-alpine`
FROM openjdk:8-jdk

# Create a mount point with a specified name to store data
# we don't store any data in this example, but in other spring boot apps,
# we might.
VOLUME /tmp

# Define a variable to add to the build step at `docker build`
ARG JAR_FILE

# Rename the user inputted file to "app.jar"
ADD target/${JAR_FILE} app.jar

# Configures the container to be run as an executable
ENTRYPOINT [ "java", "-jar", "/app.jar" ]

# Note, this is just for the person reading,
# it does not do anything, it just tells the reader that Spring is listening on
# port 8080, so you should call:
# `$ docker run -p 8765:8080 <name of docker image>
EXPOSE 8080
