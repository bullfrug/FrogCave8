package com.codingrecipe.member.repository;

import com.codingrecipe.member.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository //DB와 연관이 있음.
@RequiredArgsConstructor
public class UserRepository {
    private final SqlSessionTemplate sql;

    // 사용자 저장
    public int save(UserDTO userDTO) {
        System.out.println("userDTO = " + userDTO);
        return sql.insert("User.save", userDTO);
    }

    // 사용자 로그인
    public UserDTO login(UserDTO userDTO) {
        return sql.selectOne("User.login", userDTO);
    }

    // 모든 사용자 조회
    public List<UserDTO> findAll() {
        return sql.selectList("User.findAll");
    }

    // ID로 사용자 조회
    public UserDTO findById(Long id) {
        return sql.selectOne("User.findById", id);
    }

    // 사용자 삭제
    public void delete(Long id) {
        sql.delete("User.delete", id);
    }

    // 이메일로 사용자 조회
    public UserDTO findByMemberEmail(String loginEmail) {
        return sql.selectOne("User.findByMemberEmail", loginEmail);
    }

    // 사용자 정보 업데이트
    public int update(UserDTO userDTO) {
        return sql.update("User.update", userDTO);
    }
}
