package com.codingrecipe.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class LoginController {

    @GetMapping("/emotioncastle/log_in") //로그인 페이지를 불러온다.
    public String loginForm() {
        return "log_in"; //이름이 login 인 http 또는 jsp 파일을 불러온다.
    }

    @PostMapping("/emotioncastle/log_in") //로그인 페이지에서 정보를 받는다.
    public String PostLogin(@RequestParam String id, @RequestParam String pw, @RequestParam boolean rememberid, RedirectAttributes redirectAttributes,  HttpSession session, HttpServletResponse response) {
        System.out.println(1111111);
        System.out.println(!loginChk(id, pw));

        if (!loginChk(id, pw)) { //입력받은 id와 pw를 넣어 유효성 검사를 실행한다.
            redirectAttributes.addFlashAttribute("errorMessage", "일치하는 회원정보가 없습니다.");
            return "redirect:/emotioncastle/log_in";
        } else if (loginChk(id, pw)) {
            session.setAttribute("id", id);
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(rememberid ? 60 * 60 * 24 * 30 : 0);
            response.addCookie(cookie);
            //쿠키를 만들었는데 이걸로 뭐하지?
        }return "redirect:/index_logout";
    }

    private boolean loginChk(String id, String pw) { // 입력받은 아이디,비밀번호와 user 테이블 속 정보를 비교하기 위한 유효성검사

        String uid = "asdf"; // DB user 테이블 안에 있는 아이디 대신 사용할 임시 아이디
        String upw = "1234"; // DB user 테이블 안에 있는 비밀번호 대신 사용할 임시 아이디

        if(!uid.equals(id) || !upw.equals(pw)) {
            return false;
        }
        return true;
    }

    @GetMapping("/sign_up")
    public String getregister() {
        return "register";
    }

    @GetMapping("/find_id1")
    public String find_id() {
        return "find_id";
    }

    @GetMapping("/find_pw1")
    public String find_pw() {
        return "find_password";
    }
}

