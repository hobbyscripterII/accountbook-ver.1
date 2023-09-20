package com.accountbook.project.month.service;

import com.accountbook.project.month.dto.MonthBudgetDto;
import com.accountbook.project.month.mapper.MonthBudgetMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MonthBudgetService {
    private final MonthBudgetMapper monthBudgetMapper;

    public void insertBudget(MonthBudgetDto.insertBudgetDto insertBudgetDto) {
        monthBudgetMapper.insertBudget(insertBudgetDto);
    }

    public MonthBudgetDto selectBudget(MonthBudgetDto.selectBudgetDto selectBudgetDto) {
        return monthBudgetMapper.selectBudget(selectBudgetDto);
    }
}
