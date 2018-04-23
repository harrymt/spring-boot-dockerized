package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// Mean that this file is ready to be used by Spring MVC to handle
// web requests
@SpringBootApplication
@RestController
public class Application {

    // Maps https://my.api.endpoint/ to the home function()
    @RequestMapping("/")
    public String home() {
        return "A basic Spring Boot application";
    }

    /**
     * Runs first
     */
    public static void main(String[] args) {
        // Initialise Spring Boot application
        SpringApplication.run(Application.class, args);
    }
}
