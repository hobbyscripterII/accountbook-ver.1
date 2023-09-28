package com.accountbook.project.month.service;

import com.accountbook.project.month.dto.MonthBudgetDto;
import com.accountbook.project.month.mapper.MonthBudgetMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MonthBudgetService {
    private final MonthBudgetMapper monthBudgetMapper;

    public void insertBudget(int m_id) {
        monthBudgetMapper.insertBudget(m_id);
    }

    public int getBudget(int m_id) {
        return monthBudgetMapper.getBudget(m_id);
    }

    public MonthBudgetDto selectBudget(int m_id) {
        // ** 예산 정보 담긴 메소드(처음에 보낼 때는 기초 예산으로)
        MonthBudgetDto.Select select = MonthBudgetDto.Select.builder()
                .m_id(m_id)
                .b_cover("ALL")
                .build();
        return monthBudgetMapper.selectBudget(select);
    }

    public void updateBudget(int b_fix, int b_nonfix, int m_id, String b_cover) {
        MonthBudgetDto.Update update = MonthBudgetDto.Update.builder()
                .b_fix(b_fix)
                .b_nonfix(b_nonfix)
                .m_id(m_id)
                .b_cover(b_cover)
                .build();
        monthBudgetMapper.updateBudget(update);
    }
}