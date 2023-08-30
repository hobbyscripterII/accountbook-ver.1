package com.accountbook.project.mapper;

import com.accountbook.project.domain.Month;
import com.accountbook.project.domain.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MonthMapper {
    List<Month> selectMonthList(Object m_id);
    List<Month> selectWriteTable(Map<String, Object> map);
    List<Month> selectAccountBook(Map<String, Object> map);
    List<Category> selectAllCategory();
}