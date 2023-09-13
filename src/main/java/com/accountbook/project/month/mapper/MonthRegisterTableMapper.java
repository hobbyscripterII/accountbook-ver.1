package com.accountbook.project.month.mapper;

import com.accountbook.project.month.dto.MonthRegisterTableDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MonthRegisterTableMapper {
    void insertRow(MonthRegisterTableDto monthRegisterTableDto);
    void deleteRow(int m_id);
    void updateRow(MonthRegisterTableDto.Update monthRegisterTableDto);
}