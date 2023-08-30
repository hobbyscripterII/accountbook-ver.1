package com.accountbook.project.login.mapper;

import com.accountbook.project.login.dto.LoginDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
    LoginDto getEmail(String email);
}