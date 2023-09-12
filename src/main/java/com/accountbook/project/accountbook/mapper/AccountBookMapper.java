package com.accountbook.project.accountbook.mapper;

import com.accountbook.project.accountbook.dto.AccountBookDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AccountBookMapper {
    List<AccountBookDto> getMonthCode(int m_id);
    List<AccountBookDto> selectMonth(Map<String, Object> map);
    void insertMonth(Map<String, Object> map);
    void deleteMonth(Map<String, Object> map);
    void deleteAccountBook(Map<String, Object> map);
}