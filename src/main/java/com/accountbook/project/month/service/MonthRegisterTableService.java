package com.accountbook.project.month.service;

import com.accountbook.project.month.dto.MonthRegisterTableDto;
import com.accountbook.project.month.mapper.MonthRegisterTableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MonthRegisterTableService {
    private final MonthRegisterTableMapper monthRegisterTableMapper;

    public void insertRow(int m_id, int a_id, int a_code, String c_code, String d_date, int m_amount, String m_memo) {
        MonthRegisterTableDto.Insert insert = MonthRegisterTableDto.Insert.builder()
                .m_id(m_id)
                .a_id(a_id)
                .a_code(a_code)
                .c_code(c_code)
                .d_date(d_date)
                .m_amount(m_amount)
                .m_memo(m_memo)
                .build();
        monthRegisterTableMapper.insertRow(insert);
    }

    public void updateRow(int mo_id, String c_code, String d_date, int m_amount, String m_memo) {
        MonthRegisterTableDto.Update update = new MonthRegisterTableDto.Update();
        update.setMo_id(mo_id);
        update.setC_code(c_code);
        update.setD_date(d_date);
        update.setM_amount(m_amount);
        update.setM_memo(m_memo);
        monthRegisterTableMapper.updateRow(update);}

    public void deleteRow(int mo_id) {
        monthRegisterTableMapper.deleteRow(mo_id);}
}