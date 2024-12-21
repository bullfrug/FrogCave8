package com.codingrecipe.member.service;


import com.codingrecipe.member.dto.UserDTO;
import com.codingrecipe.member.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor //는 final 만 붙어야함.
public class UserService {
    private final UserRepository userRepository; //final은 필수

    public int save(UserDTO userDTO) {
        return userRepository.save(userDTO);
    }

    public boolean login(UserDTO userDTO) {
        UserDTO loginMember = userRepository.login(userDTO);
        if (loginMember != null) {
            return true;
        } else {
            return false;
        }
    }

    public List<UserDTO> findAll() {
        return userRepository.findAll();
    }

    public UserDTO findById(Long id) {
        return userRepository.findById(id);
    }

    public void delete(Long id) {
        userRepository.delete(id);
    }

    public UserDTO findByMemberEmail(String loginEmail) {
        return userRepository.findByMemberEmail(loginEmail);
    }

    public boolean update(UserDTO userDTO) {
        int result = userRepository.update(userDTO);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public String emailCheck(String memberEmail) {
        UserDTO userDTO = userRepository.findByMemberEmail(memberEmail);
        if (userDTO == null) {
            return "ok";
        } else {
            return "no";
        }
    }
}
