package com.accountbook.project.service;

import com.accountbook.project.domain.Month;
import com.accountbook.project.domain.Category;
import com.accountbook.project.mapper.MonthMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MonthService {
    private final MonthMapper monthMapper;
    public List<Month> selectAccountBook(Map<String, Object> map) { return monthMapper.selectAccountBook(map); }
    public List<Month> selectWriteTable(Map<String, Object> map) { return monthMapper.selectWriteTable(map);}
    public List<Category> selectAllCategory() { return monthMapper.selectAllCategory();}
    public List<Month> selectMonthList(Object m_id) { return monthMapper.selectMonthList(m_id); }
}