package com.accountbook.project.login.service;

import com.accountbook.project.login.dto.LoginDto;
import com.accountbook.project.login.mapper.LoginMapper;
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
}
