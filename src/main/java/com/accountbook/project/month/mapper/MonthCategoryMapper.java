package com.accountbook.project.month.mapper;

import com.accountbook.project.month.dto.MonthCategoryDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MonthCategoryMapper {
    void insertIncome(MonthCategoryDto.Insert insert);
    void insertSave(MonthCategoryDto.Insert insert);
    void insertFix(MonthCategoryDto.Insert insert);
    void insertNonfix(MonthCategoryDto.Insert insert);
    List<MonthCategoryDto.Select> selectCategory(int m_id);
}