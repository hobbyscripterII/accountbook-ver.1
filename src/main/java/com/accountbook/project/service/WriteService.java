package com.accountbook.project.service;

import com.accountbook.project.domain.Write;
import com.accountbook.project.mapper.WriteMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class WriteService {
    private final WriteMapper writeMapper;

    public void checkDate(Write write) {writeMapper.checkDate(write);}
    public void insertWriteTableRow(Write write) {writeMapper.insertWriteTableRow(write);}
    public void deleteWriteTableRow(int m_id) {writeMapper.deleteWriteTableRow(m_id);}
    public void updateWriteTableRow(Write write) {writeMapper.updateWriteTableRow(write);}
}
