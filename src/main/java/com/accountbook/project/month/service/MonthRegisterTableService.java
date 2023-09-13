package com.accountbook.project.month.service;

import com.accountbook.project.month.dto.MonthRegisterTableDto;
import com.accountbook.project.month.mapper.MonthRegisterTableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MonthRegisterTableService {
    private final MonthRegisterTableMapper monthRegisterTableMapper;

    public void insertRow(MonthRegisterTableDto monthRegisterTableDto) {
        monthRegisterTableMapper.insertRow(monthRegisterTableDto);}
    public void updateRow(MonthRegisterTableDto.Update monthRegisterTableDto) {
        monthRegisterTableMapper.updateRow(monthRegisterTableDto);}
    public void deleteRow(int m_id) {
        monthRegisterTableMapper.deleteRow(m_id);}
}