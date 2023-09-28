package com.accountbook.project.member.service;

import com.accountbook.project.member.dto.SignUpDto;
import com.accountbook.project.member.mapper.SignUpMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SignUpService {
    private final SignUpMapper signUpMapper;

    public void signUp(SignUpDto signUpDto) {
        signUpMapper.signUp(signUpDto);
    }
}