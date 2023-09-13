package com.accountbook.project.month.service;

import com.accountbook.project.month.dto.MonthChartDto;
import com.accountbook.project.month.mapper.MonthChartMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MonthChartService {
    private final MonthChartMapper monthChartMapper;

    public List<MonthChartDto> getMemberMonthCategorySum(Map<String, Object> map) {
        return monthChartMapper.getMemberMonthCategorySum(map);
    }
}