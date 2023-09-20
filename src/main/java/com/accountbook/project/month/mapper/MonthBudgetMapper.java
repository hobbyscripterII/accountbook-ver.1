package com.accountbook.project.month.mapper;

import com.accountbook.project.month.dto.MonthBudgetDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MonthBudgetMapper {
    void insertBudget(MonthBudgetDto.insertBudgetDto insertBudgetDto);
    MonthBudgetDto selectBudget(MonthBudgetDto.selectBudgetDto selectBudgetDto);
}
