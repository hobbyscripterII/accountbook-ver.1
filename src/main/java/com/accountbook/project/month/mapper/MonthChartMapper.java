package com.accountbook.project.month.mapper;

import com.accountbook.project.month.dto.MonthChartDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MonthChartMapper {
    List<MonthChartDto> getMemberMonthCategorySum(Map<String, Object> map);
    List<MonthChartDto> getMemberMonthCategoryAvg(int me_id);
    List<MonthChartDto> getNotMemberMonthCategoryAvg(int me_id);
    String getName(int m_id);
}