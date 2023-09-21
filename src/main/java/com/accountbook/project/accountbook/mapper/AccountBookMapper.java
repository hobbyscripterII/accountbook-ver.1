package com.accountbook.project.accountbook.mapper;

import com.accountbook.project.accountbook.dto.AccountBookDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AccountBookMapper {
    List<AccountBookDto> getACode(int m_id);
    List<AccountBookDto> getAccountBook(Map<String, Object> map);
    void insertAccountBook(AccountBookDto.Insert insert);
    void deleteAccountBook(AccountBookDto.Delete delete);
    void deleteMonth(AccountBookDto.Delete delete);
}