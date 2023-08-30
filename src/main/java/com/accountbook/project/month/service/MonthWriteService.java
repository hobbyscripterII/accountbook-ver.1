package com.accountbook.project.month.service;

import com.accountbook.project.month.dto.MonthTableDto;
import com.accountbook.project.month.mapper.MonthWriteMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MonthWriteService {
    private final MonthWriteMapper monthWriteMapper;

    public void insertRow(MonthTableDto monthTableDto) {monthWriteMapper.insertRow(monthTableDto);}
    public void updateRow(MonthTableDto.Update monthTableDto) {monthWriteMapper.updateRow(monthTableDto);}
    public void deleteRow(int m_id) {monthWriteMapper.deleteRow(m_id);}
    public void getDate(MonthTableDto.getDate monthTableDto) {monthWriteMapper.getDate(monthTableDto);}
}