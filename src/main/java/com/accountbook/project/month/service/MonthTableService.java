package com.accountbook.project.month.service;

import com.accountbook.project.month.dto.MonthCategoryDto;
import com.accountbook.project.month.dto.MonthTableDto;
import com.accountbook.project.month.mapper.MonthTableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MonthTableService {
    private final MonthTableMapper monthMapper;

    public List<MonthCategoryDto> getMonthCategory() { return monthMapper.getMonthCategory(); }
    public List<MonthTableDto> getMonth(Map<String, Object> map) { return monthMapper.getMonth(map);}
    public List<MonthCategoryDto.TableInfo> getTableInfo(Map<String, Object> map) {return monthMapper.getTableInfo(map);}
}