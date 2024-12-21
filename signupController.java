package com.codingrecipe.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

// 이건 메모리에 저장된 데이터 기반으로 아이디 중복 검사 수행하는 구조
// 회원가입 및 로그인 컨트롤러
@Controller
@RequestMapping("/emotioncastle")
public class signupController {

    // 가상의 데이터 저장소
    private final Set<String> userIds = new HashSet<>();  // 아이디 저장
    private final Map<String, Map<String, String>> userData = new HashMap<>(); // 전체 회원 데이터 저장

    // 회원가입 페이지로 이동
    @GetMapping("/sign_up")
    public String index() {
        return "signup"; // signup.html로 이동
    }

    // 아이디 중복 확인
    @GetMapping("/auth/check-username")
    @ResponseBody
    public Map<String, String> checkUsername(@RequestParam("memberId") String memberId) {
        boolean isDuplicate = userIds.contains(memberId);
        return Map.of("status", isDuplicate ? "duplicate" : "available");
    }

    // 회원가입 처리
    @PostMapping("/sign_up")
    public String registerUser(
            @RequestParam("memberId") String memberId,
            @RequestParam("password") String password,
            @RequestParam("confirmPassword") String confirmPassword,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("phone1") String phone1,
            @RequestParam("phone2") String phone2,
            @RequestParam("phone3") String phone3,
            Model model) {

        // 비밀번호 확인
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            return "signup"; // 다시 폼으로 이동
        }

        // 아이디 중복 확인
        if (userIds.contains(memberId)) {
            model.addAttribute("error", "이미 사용 중인 아이디입니다.");
            return "signup"; // 다시 폼으로 이동
        }

        // 유효성 검사 (아이디, 이메일, 전화번호 등)
        if (!memberId.matches("^[a-z0-9_-]{6,12}$")) {
            model.addAttribute("error", "아이디는 영문 소문자, 숫자, 특수문자(_,-) 조합으로 6-12자여야 합니다.");
            return "signup";
        }

        if (!email.matches("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            model.addAttribute("error", "올바른 이메일 형식이 아닙니다.");
            return "signup";
        }

        if (!phone1.matches("^01[016789]$") || !phone2.matches("^\\d{3,4}$") || !phone3.matches("^\\d{4}$")) {
            model.addAttribute("error", "휴대폰 번호 형식이 올바르지 않습니다.");
            return "signup";
        }

        // 데이터 저장
        userIds.add(memberId);
        userData.put(memberId, Map.of(
                "password", password,
                "name", name,
                "email", email,
                "phone", phone1 + "-" + phone2 + "-" + phone3
        ));

        // 리디렉션하면서 메시지 전달
        model.addAttribute("message", "회원가입을 축하합니다!");
        return "redirect:/emotioncastle/log_in"; // 로그인 페이지로 리디렉션
    }

    // 모든 사용자 확인 (테스트용)
    @GetMapping("/users")
    @ResponseBody
    public Map<String, Map<String, String>> getAllUsers() {
        return userData;
    }
}