package com.accountbook.project.month.service;

import com.accountbook.project.month.dto.MonthCategoryDto;
import com.accountbook.project.month.dto.MonthCodeDto;
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
    public List<MonthCategoryDto> getMonthCategory() { return monthMapper.getMonthCategory();}
    public List<MonthCodeDto> getMonthCode(Object m_id) { return monthMapper.getMonthCode(m_id); }
    public List<MonthCodeDto> selectMonth(Map<String, Object> map) { return monthMapper.selectMonth(map); }
    public List<MonthTableDto> getMonth(Map<String, Object> map) { return monthMapper.getMonth(map);}
}