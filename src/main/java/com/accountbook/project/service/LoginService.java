package com.accountbook.project.service;

import com.accountbook.project.domain.Member;
import com.accountbook.project.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {
    private final MemberMapper memberMapper;

    public Member login(String email, String pwd) {
        Member member = memberMapper.selectMember(email);
        if (email.equals(member.getM_email()) && pwd.equals(member.getM_pwd())) {
            return member;
        }
        return null;
    }
}
