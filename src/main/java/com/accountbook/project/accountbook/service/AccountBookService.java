package com.accountbook.project.accountbook.service;

import com.accountbook.project.accountbook.dto.AccountBookDto;
import com.accountbook.project.accountbook.mapper.AccountBookMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AccountBookService {
    private final AccountBookMapper accountBookMapper;

    public List<AccountBookDto> getACode(int m_id) { return accountBookMapper.getACode(m_id); }
    public List<AccountBookDto> getAccountBook(Map<String, Object> map) { return accountBookMapper.getAccountBook(map); }
    public void insertAccountBook(AccountBookDto.Insert insert) { accountBookMapper.insertAccountBook(insert); }
    public void deleteAccountBook(AccountBookDto.Delete delete) { accountBookMapper.deleteAccountBook(delete); }
    public void deleteMonth(AccountBookDto.Delete delete) { accountBookMapper.deleteMonth(delete); }
}