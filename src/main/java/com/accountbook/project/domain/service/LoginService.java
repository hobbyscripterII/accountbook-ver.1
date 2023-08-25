package com.accountbook.project.domain.service;

import com.accountbook.project.domain.domain.Member;
import com.accountbook.project.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {
    private final MemberMapper memberMapper;

    public Member login(String email, String pwd) {
        Member member = memberMapper.selectMember(email);
        if (email.equals(member.getEmail()) && pwd.equals(member.getPwd())) {
            return member;
        }
        return null;
    }
}
