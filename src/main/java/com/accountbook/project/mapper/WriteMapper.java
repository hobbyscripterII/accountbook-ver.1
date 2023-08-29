package com.accountbook.project.mapper;

import com.accountbook.project.domain.Write;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WriteMapper {
    void checkDate(Write write);
    void insertWriteTable(Write write);
    void deleteWriteTableRow(int m_id);
}
