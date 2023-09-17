package com.accountbook.project.home.Mapper;

import com.accountbook.project.home.Dto.HomeDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HomeMapper {
    HomeDto getName(int m_id);
}