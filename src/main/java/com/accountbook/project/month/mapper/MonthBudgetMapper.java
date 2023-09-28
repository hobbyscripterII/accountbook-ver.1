package com.accountbook.project.month.mapper;

import com.accountbook.project.month.dto.MonthBudgetDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MonthBudgetMapper {
    void insertBudget(int m_id);
    int getBudget(int m_id);
    MonthBudgetDto selectBudget(MonthBudgetDto.Select select);
    void updateBudget(MonthBudgetDto.Update update);
}
