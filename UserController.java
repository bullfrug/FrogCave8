package com.codingrecipe.member.controller;

import com.codingrecipe.member.dto.UserDTO;
import com.codingrecipe.member.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService; // MemberService를 UserService로 변경

    @GetMapping("/save") // 링크를 타고 오기 때문에 getMapping을 씀.
    public String saveForm() {
        return "save"; // 사용자 등록 폼을 반환
    }

    // 가입 성공과 실패 구분 케이스
    @PostMapping("/save")
    public String save(@ModelAttribute UserDTO userDTO) {
        int saveResult = userService.save(userDTO); // memberService를 userService로 변경
        if (saveResult > 0) {
            return "login"; // 가입 성공 시 로그인 페이지로 이동
        } else {
            return "save"; // 가입 실패 시 다시 등록 폼으로 이동
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login"; // 로그인 폼을 반환
    }

    @PostMapping("/login")
    public String login(@ModelAttribute UserDTO userDTO,
                        HttpSession session) {
        boolean loginResult = userService.login(userDTO); // memberService를 userService로 변경
        if (loginResult) {
            session.setAttribute("loginEmail", userDTO.getEmail()); // 로그인 성공 시 세션에 이메일 저장
            return "main"; // 메인 페이지로 이동
        } else {
            return "login"; // 로그인 실패 시 다시 로그인 폼으로 이동
        }
    }

    @GetMapping("/")
    public String findAll(Model model) {
        List<UserDTO> userDTOList = userService.findAll(); // memberService를 userService로 변경
        model.addAttribute("userList", userDTOList); // memberList를 userList로 변경
        return "list"; // 사용자 목록을 보여주는 뷰 반환
    }

    // /user?id=1
    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model) {
        UserDTO userDTO = userService.findById(id); // memberService를 userService로 변경
        model.addAttribute("user", userDTO); // member를 user로 변경
        return "detail"; // 사용자 상세 정보를 보여주는 뷰 반환
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        userService.delete(id); // memberService를 userService로 변경
        return "redirect:/user/"; // 리다이렉트 URL을 /user/로 변경
    }



    // 수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute UserDTO userDTO) {
        boolean result = userService.update(userDTO); // memberService를 userService로 변경
        if (result) {
            return "redirect:/user?id=" + userDTO.getId(); // URL 경로를 member에서 user로 변경
        } else {
            return "index"; // 실패 시 리다이렉트할 페이지는 그대로 유지
        }
    }

    @PostMapping("/email-check")
    public @ResponseBody String emailCheck(@RequestParam("userEmail") String userEmail) { // memberEmail을 userEmail로 변경
        System.out.println("userEmail = " + userEmail); // 출력 메시지 변경
        String checkResult = userService.emailCheck(userEmail); // memberService를 userService로 변경
        return checkResult;
    }
}