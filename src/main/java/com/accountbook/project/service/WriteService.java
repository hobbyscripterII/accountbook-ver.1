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
    public void insertWriteTable(Write write) {writeMapper.insertWriteTable(write);}
    public void deleteWriteTableRow(int m_id) {writeMapper.deleteWriteTableRow(m_id);}


}
