package com.accountbook.project.member.mapper;

import com.accountbook.project.member.dto.LoginDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
    LoginDto getEmail(String email);
    void updateVisitNum(int m_id);
}