package com.example.demo;

import lombok.Builder;
import lombok.Data;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("hello")
public class Controller {

    @GetMapping
    public Greetings hello() {
        return Greetings.builder().message("Hello Dr.K!").build();
    }

    @Data
    @Builder
    static class Greetings {
        private String message;
    }
}