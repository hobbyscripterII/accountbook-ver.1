package com.accountbook.project.month.mapper;

import com.accountbook.project.month.dto.MonthCategoryDto;
import com.accountbook.project.month.dto.MonthTableDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MonthTableMapper {
    List<MonthCategoryDto> getMonthCategory();
    List<MonthTableDto> getMonth(Map<String, Object> map);
    List<MonthCategoryDto.TableInfo> getTableInfo(Map<String, Object> map);
}