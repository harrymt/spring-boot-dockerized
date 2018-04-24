# Spring Boot Dockerized

A spring boot [maven](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html) application that is [Dockerized](https://docker.com/).

- Uses a [Docker Maven Plugin](https://github.com/spotify/dockerfile-maven) by Spotify.

### How to Dockerize a Spring Boot application

1. Create/Take a basic Spring Boot application
2. Create a [`Dockerfile`](Dockerfile) in the root
3. Make note of the follow `pom.xml` field:

```xml
<!-- Name of the Spring Boot application -->
<artifactId>harrymt-spring-boot-docker</artifactId>
```

4. Add the following plugin to your pom file:

```xml
<plugin>
    <groupId>com.spotify</groupId>
    <artifactId>dockerfile-maven-plugin</artifactId>
    <version>1.4.0</version>
    <executions>
        <execution>
        <id>default</id>
        <goals>
            <goal>build</goal>
        </goals>
        </execution>
    </executions>
    <configuration>
        <repository>${project.artifactId}</repository>
        <tag>latest</tag>
        <buildArgs>
            <JAR_FILE>${project.build.finalName}.jar</JAR_FILE>
        </buildArgs>
    </configuration>
</plugin>
```

5. Now you are ready to build a docker image with:

```
$ mvn package
```

6. You should have created a docker image called `harrymt-spring-boot-docker`!
7. Type the docker command to list all images

```
$ docker images
```

8. Now run the image with port networking from the Spring boot port (8080) to our port 8081

```
$ docker run -p 8081:8080 harrymt-spring-boot-docker
```

9. View the spring application at http://localhost:8081

10. Now for cleanup:

```
# View running containers
$ docker ps -a
# Copy the first 4 chars of the CONTAINER ID running

# Stop and remove the running container
$ docker stop <the copied CONTAINER ID>
$ docker rm <the copied CONTAINER ID>

# Remove image we packaged
$ docker rmi harrymt-spring-boot-docker
```

### Summary

```
$ git clone https://github.com/harrymt/spring-boot-dockerized .
$ mvn package

# Test that it works without being in a container
$ java -jar target/harrymt-spring-boot-docker-0.1.0.jar

# Create image
$ mvn package

# Run image and view it at http://localhost:8081
$ docker run -p 8081:8080 harrymt-spring-boot-docker
```

### FAQ

- Could not build image: Connection Refused?
    - If you are on Docker for Windows: Tick 'Expose daemon on tcp://localhost:2375 without TLS' on Docker->Settings->General
