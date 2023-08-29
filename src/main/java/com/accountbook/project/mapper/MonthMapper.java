package com.accountbook.project.mapper;

import com.accountbook.project.domain.Month;
import com.accountbook.project.domain.MonthCategory;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MonthMapper {
    List<Month> selectWriteTable(Map<String, Object> map);
    List<MonthCategory> selectAllCategory();
}