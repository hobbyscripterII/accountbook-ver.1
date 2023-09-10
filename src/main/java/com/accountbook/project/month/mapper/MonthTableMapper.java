package com.accountbook.project.month.mapper;

import com.accountbook.project.month.dto.MonthCategoryDto;
import com.accountbook.project.month.dto.MonthCodeDto;
import com.accountbook.project.month.dto.MonthTableDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MonthTableMapper {
    List<MonthCategoryDto> getMonthCategory();
    List<MonthCodeDto> getMonthCode(int m_id);
    List<MonthCodeDto> selectMonth(Map<String, Object> map);
    List<MonthTableDto> getMonth(Map<String, Object> map);
    List<MonthCategoryDto.TableInfo> getTableInfo(Map<String, Object> map);
}