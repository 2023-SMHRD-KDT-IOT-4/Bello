package com.smhrd.bello.websocket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hello")
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "helloPage"; // 뷰 이름 또는 다른 응답을 반환할 수 있습니다.
    }
}