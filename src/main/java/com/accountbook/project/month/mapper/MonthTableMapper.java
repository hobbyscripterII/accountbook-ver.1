package com.accountbook.project.month.mapper;

import com.accountbook.project.month.dto.MonthTableDto;
import com.accountbook.project.month.dto.MonthRegisterTableDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MonthTableMapper {
    List<MonthTableDto.getCategory> getCategory();
    List<MonthRegisterTableDto> getMonth(Map<String, Object> map);
    List<MonthTableDto.getTable> getTable(Map<String, Object> map);
}
