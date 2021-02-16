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
    public A hello() {
        return A.builder().s("Hello").build();
    }

    @Data
    @Builder
    static class A {
        private String s;
    }
}