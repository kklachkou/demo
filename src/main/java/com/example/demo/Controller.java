package com.example.demo;

import lombok.Builder;
import lombok.Data;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/")
public class Controller {

    @GetMapping("hello")
    public Greetings hello() {
        return Greetings.builder().message("Hello Dr.K!").build();
    }

    @GetMapping("oom")
    public String outOfMemory() {
        try {
            List<Integer> list = new ArrayList<>();
            while (true) list.add(1);
        } catch (Throwable t) {
            System.out.println(t);
        }
        return "Finish";
    }

    @Data
    @Builder
    static class Greetings {
        private String message;
    }
}