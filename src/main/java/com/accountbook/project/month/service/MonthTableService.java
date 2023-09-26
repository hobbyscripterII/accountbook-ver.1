package com.accountbook.project.month.service;

import com.accountbook.project.month.dto.MonthTableDto;
import com.accountbook.project.month.dto.MonthRegisterTableDto;
import com.accountbook.project.month.mapper.MonthTableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MonthTableService {
    private final MonthTableMapper monthTableMapper;

    public List<MonthTableDto.getCategory> getCategory() { return monthTableMapper.getCategory(); }
    public List<MonthRegisterTableDto> getMonth(Map<String, Object> map) { return monthTableMapper.getMonth(map); }
    public List<MonthTableDto.getTable> getTableInfo(Map<String, Object> map) { return monthTableMapper.getTable(map); }

//    public List<MonthTableDto.getTable> getTableInfo(Map<String, Object> map) {return monthTableMapper.getTable(map); }
}