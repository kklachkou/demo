package com.example.demo;

import io.vavr.control.Try;
import lombok.Builder;
import lombok.Data;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("hello")
public class Controller {

    @GetMapping
    public Greetings hello() {
        return Greetings.builder().message("Hello Dr.K!").build();
    }

    @GetMapping("/oome")
    public void oome() {
        Try.run(this::oome3);
    }

    private void oome3() {
        List<Byte> list = new ArrayList<>();
        while (true) list.add((byte) 1);
    }

    @Data
    @Builder
    static class Greetings {
        private String message;
    }
}