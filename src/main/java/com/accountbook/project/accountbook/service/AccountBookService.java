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

    public List<AccountBookDto> getMonthCode(int m_id) { return accountBookMapper.getMonthCode(m_id); }
    public List<AccountBookDto> selectMonth(Map<String, Object> map) { return accountBookMapper.selectMonth(map); }
    public void insertMonth(Map<String, Object> map) { accountBookMapper.insertMonth(map); }
    public void deleteMonth(Map<String, Object> map) { accountBookMapper.deleteMonth(map); }
    public void deleteAccountBook(Map<String, Object> map) { accountBookMapper.deleteAccountBook(map); }
}