package com.codingrecipe.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//메인페이지 컨트롤러
@Controller
public class MainController {
    @GetMapping("/emotioncastle/")
    public String mainPage() {
        return "main"; // main.jsp로 이동
    }
}