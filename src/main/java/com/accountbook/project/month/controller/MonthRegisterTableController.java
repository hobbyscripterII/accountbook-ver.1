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
    public void insert(@RequestParam int m_id, @RequestParam int a_id, @RequestParam int a_code, @RequestParam String c_code, @RequestParam String d_date, @RequestParam int m_amount, @RequestParam String m_memo) {
        monthRegisterTableService.insertRow(m_id, a_id, a_code, c_code, d_date, m_amount, m_memo);
    }

    @ResponseBody
    @RequestMapping("/update")
    public void update(@RequestParam int mo_id, @RequestParam String c_code, @RequestParam String d_date, @RequestParam int m_amount, @RequestParam String m_memo) {
        monthRegisterTableService.updateRow(mo_id, c_code, d_date, m_amount, m_memo);
    }

    @ResponseBody
    @PostMapping("/delete")
    public void deleteRow(@RequestParam int mo_id) {
        monthRegisterTableService.deleteRow(mo_id);
    }
}