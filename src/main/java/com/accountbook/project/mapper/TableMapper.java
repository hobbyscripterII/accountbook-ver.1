package com.accountbook.project.mapper;

import com.accountbook.project.domain.Table;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TableMapper {
    List<Table> selectIncome(Table table);
    List<Table> selectFix(Table table);
    List<Table> selectNonFix(Table table);
}