package com.accountbook.project.domain.service;

import com.accountbook.project.domain.domain.Income;
import com.accountbook.project.mapper.IncomeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;


@Slf4j
@Service
@RequiredArgsConstructor
public class IncomeService {
    private final IncomeMapper incomeMapper;

    List<Income> findUserIncome(Object id) {
        return incomeMapper.selectIncome(id);
    }
}
