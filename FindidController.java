package com.codingrecipe.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FindidController {
    private static final Logger log = LoggerFactory.getLogger(FindidController.class);

    @GetMapping("/emotioncastle/find_id") //아이디찾기 페이지를 불러온다.
    public String findId() {
        log.info("아이디 찾기 페이지 요청됨."); // 로그 추가
        return "find_id"; //이름이 find_id 인 http 또는 jsp 파일을 불러온다.
    }

    @PostMapping("/emotioncastle/find_id")
    public String postFindId(@RequestParam String name, @RequestParam String email, Model model, RedirectAttributes redirectAttributes) {

        if(!findidChk(name, email)) {
            redirectAttributes.addFlashAttribute("errorMessage", "일치하는 회원정보가 없습니다.");
            return "redirect:/emotioncastle/find_id";
        }
        else if (findidChk(name, email)) {
            redirectAttributes.addFlashAttribute("successMessage", "회원님의 아이디는 " + "asdf" + "입니다.");
        }
        return "redirect:/emotioncastle/log_in";
    }
//        model.addAttribute("Message", "회원님의 아이디는 " + "asdf" + " 입니다."); //asdf 대신 디비에서 긁어와야함
    //이부분 왜 안될까? 성공메시지로 아이디 알려주기 띄우고싶은데..일단 나중에

    private boolean findidChk(String name, String email) {
        String uname = "하츄핑";
        String uemail = "heartping@naver.com";

        if(!uname.equals(name) || !uemail.equals(email)) {
            return false;
        }
        return true;
    }
}
