package com.accountbook.project.month.mapper;

import com.accountbook.project.month.dto.MonthRegisterTableDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MonthRegisterTableMapper {
    void insertRow(MonthRegisterTableDto.Insert insert);
    void deleteRow(int mo_id);
    void updateRow(MonthRegisterTableDto.Update update);
}