package com.accountbook.project.mapper;

import com.accountbook.project.domain.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    Member selectMember(String email);
}