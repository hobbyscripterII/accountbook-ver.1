package com.accountbook.project.month.mapper;

import com.accountbook.project.month.dto.MonthTableDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MonthWriteMapper {
    void insertRow(MonthTableDto monthTableDto);
    void deleteRow(int m_id);
    void updateRow(MonthTableDto.Update monthTableDto);
    void getDate(MonthTableDto.getDate monthTableDto);
}