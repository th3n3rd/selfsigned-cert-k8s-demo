package com.example.selfsigned;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@ResponseBody
public class GreetingController {

    @GetMapping("/")
    public String greet() {
        return "Hello World!";
    }
}
