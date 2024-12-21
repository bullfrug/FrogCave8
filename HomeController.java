package com.codingrecipe.member.controller;

import com.codingrecipe.member.dto.MemberDto;
import com.codingrecipe.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/emotioncastle")
public class HomeController {

    private final MemberService memberService;

    @Autowired
    public HomeController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping("/index")
    public String index() {
        return "index"; // index.jsp 또는 index.html로 이동
    }

    @GetMapping("/log_in")
    public String login() {
        return "log_in"; // log_in.jsp 또는 log_in.html로 이동
    }

    @GetMapping("/register")
    public String registerForm() {
        return "register"; // register.jsp로 이동
    }

    @GetMapping("/auth/check-username")
    @ResponseBody
    public String checkUsername(@RequestParam("memberId") String memberId) {
        return memberService.isMemberIdDuplicate(memberId) ? "duplicate" : "available";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute MemberDto memberDto, Model model) {
        boolean success = memberService.registerMember(memberDto);
        if (!success) {
            model.addAttribute("error", "이미 사용 중인 아이디입니다.");
            return "register";
        }
        model.addAttribute("success", "회원가입이 완료되었습니다!");
        return "redirect:/emotioncastle/log_in";
    }
}
