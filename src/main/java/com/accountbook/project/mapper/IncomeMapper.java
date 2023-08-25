package com.accountbook.project.mapper;

import com.accountbook.project.domain.domain.Income;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IncomeMapper {
    List<Income> selectIncome(Object id);
}