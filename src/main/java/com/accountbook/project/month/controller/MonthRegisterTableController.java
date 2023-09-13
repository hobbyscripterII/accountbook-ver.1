package com.accountbook.project.month.controller;

import com.accountbook.project.month.dto.MonthRegisterTableDto;
import com.accountbook.project.month.service.MonthRegisterTableService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequestMapping("/mw")
@RequiredArgsConstructor
public class MonthRegisterTableController {
    private final MonthRegisterTableService monthRegisterTableService;

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(@RequestParam int me_id, @RequestParam int a_id, @RequestParam int a_code, @RequestParam String c_code, @RequestParam String d_date, @RequestParam int m_amount, @RequestParam String m_memo) {
        MonthRegisterTableDto write = new MonthRegisterTableDto();
        write.setMe_id(me_id);
        write.setA_id(a_id);
        write.setA_code(a_code);
        write.setC_code(c_code);
        write.setD_date(d_date);
        write.setM_amount(m_amount);
        write.setM_memo(m_memo);
        monthRegisterTableService.insertRow(write);
    }

    @ResponseBody
    @RequestMapping("/update")
    public void update(@RequestParam int m_id, @RequestParam String c_code, @RequestParam String d_date, @RequestParam int m_amount, @RequestParam String m_memo) {
        MonthRegisterTableDto.Update update = new MonthRegisterTableDto.Update();
        update.setM_id(m_id);
        update.setC_code(c_code);
        update.setD_date(d_date);
        update.setM_amount(m_amount);
        update.setM_memo(m_memo);
        monthRegisterTableService.updateRow(update);
    }

    @ResponseBody
    @PostMapping("/delete")
    public void deleteRow(@RequestParam int m_id) {
        monthRegisterTableService.deleteRow(m_id);
    }
}