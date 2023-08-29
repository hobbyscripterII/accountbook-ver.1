package com.accountbook.project.service;

import com.accountbook.project.domain.Month;
import com.accountbook.project.domain.MonthCategory;
import com.accountbook.project.mapper.MonthMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MonthService {
    private final MonthMapper monthMapper;

    public List<Month> selectWriteTable(Map<String, Object> map) {
        return monthMapper.selectWriteTable(map);
    }
    public List<MonthCategory> selectAllCategory() {
        return monthMapper.selectAllCategory();
    }
}