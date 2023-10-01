package com.accountbook.project.member.service;

import com.accountbook.project.member.dto.LoginDto;
import com.accountbook.project.member.mapper.LoginMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {
    private final LoginMapper loginMapper;

    public LoginDto login(String email, String pwd) {
        LoginDto loginDto = loginMapper.getEmail(email);
        if (email.equals(loginDto.getM_email()) && pwd.equals(loginDto.getM_pwd())) {
            return loginDto;
        }
        return null;
    }

    public void updateVisitNum(int m_id) {
        loginMapper.updateVisitNum(m_id);
    }

    public String getName(int m_id) {
        return loginMapper.getName(m_id);
    }
}