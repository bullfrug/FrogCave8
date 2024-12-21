package com.codingrecipe.member.service;

import com.codingrecipe.member.dto.MemberDto;
import com.codingrecipe.member.model.Member;
import com.codingrecipe.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    private final MemberRepository memberRepository;

    @Autowired
    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    // 회원가입 로직
    public boolean registerMember(MemberDto memberDto) {
        if (memberRepository.existsByMemberId(memberDto.getMemberId())) {
            return false; // 중복된 아이디
        }

        Member member = new Member();
        member.setMemberId(memberDto.getMemberId());
        member.setPassword(memberDto.getPassword());
        member.setName(memberDto.getName());
        member.setEmail(memberDto.getEmail());
        member.setPhone(memberDto.getPhone());
        member.setMarketing(memberDto.isMarketing());

        memberRepository.save(member);
        return true;
    }

    // 아이디 중복 검사
    public boolean isMemberIdDuplicate(String memberId) {
        return memberRepository.existsByMemberId(memberId);
    }
}
