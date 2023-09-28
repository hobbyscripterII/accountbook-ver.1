package com.accountbook.project.member.mapper;

import com.accountbook.project.member.dto.SignUpDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SignUpMapper {
    void signUp(SignUpDto signUpDto);
}
