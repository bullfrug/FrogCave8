//package com.codingrecipe.member.controller;

//import com.codingrecipe.member.dto.User;
//import com.codingrecipe.member.repository.UserRepository;
//import com.codingrecipe.member.dto.User;
//import com.codingrecipe.member.repository.UserRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import com.codingrecipe.member.dto.User;
//import com.codingrecipe.member.repository.UserRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;

//import java.util.Map;

// 이건 실제 DB 사용시 회원가입 꼰뜨롤라.

//@Controller
//@RequestMapping("/emotioncastle")
//public class RegisterController {

//    private final UserRepository userRepository;

//    @Autowired
//    public SignupController(UserRepository userRepository) {
//        this.userRepository = userRepository;
//    }

    // 회원가입 페이지로 이동
//    @GetMapping("/sign_up")
//    public String index() {
//        return "signup"; // signup.html로 이동
//    }

    // 아이디 중복 확인
//    @GetMapping("/auth/check-username")
//    @ResponseBody
//    public Map<String, String> checkUsername(@RequestParam("memberId") String memberId) {
//        return Map.of(
//                "status", isDuplicate ? "duplicate" : "available",
//                "message", isDuplicate ? "이미 사용 중인 아이디입니다." : "사용 가능한 아이디입니다."
//        );
//    }

    // 회원가입 처리
//    @PostMapping("/sign_up")
//    public String registerUser(
//            @RequestParam("memberId") String memberId,
//            @RequestParam("password") String password,
//            @RequestParam("confirmPassword") String confirmPassword,
 //           @RequestParam("name") String name,
//            @RequestParam("email") String email,
 //           @RequestParam("phone1") String phone1,
//            @RequestParam("phone2") String phone2,
//            @RequestParam("phone3") String phone3,
//            Model model) {

        // 비밀번호 확인
//        if (!password.equals(confirmPassword)) {
//            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
//            return "signup"; // 다시 폼으로 이동
//        }

        // 아이디 중복 확인
 //       if (userRepository.existsByMemberId(memberId)) {
  //          model.addAttribute("error", "이미 사용 중인 아이디입니다.");
 //           return "signup"; // 다시 폼으로 이동
  //      }

        // 데이터 저장
//        User user = new User();
 //       user.setMemberId(memberId);
//        user.setPassword(password);
//        user.setName(name);
//        user.setEmail(email);
//        user.setPhone(phone1 + "-" + phone2 + "-" + phone3);
 //       userRepository.save(user);

        // 리디렉션하면서 메시지 전달
  //      model.addAttribute("message", "회원가입을 축하합니다!");
  //     return "redirect:/emotioncastle/log_in"; // 로그인 페이지로 리디렉션
//    }
//}