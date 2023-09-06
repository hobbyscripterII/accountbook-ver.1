package com.accountbook.project.month.controller;

import com.accountbook.project.month.dto.MonthTableDto;
import com.accountbook.project.month.service.MonthWriteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequestMapping("/mw")
@RequiredArgsConstructor
public class MonthWriteController {
    private final MonthWriteService writeService;

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(@RequestParam int me_id, @RequestParam int a_id, @RequestParam int a_code, @RequestParam String c_code, @RequestParam String d_date, @RequestParam int m_amount, @RequestParam String m_memo) {
        getDate(me_id, d_date);

        MonthTableDto write = new MonthTableDto();
        write.setMe_id(me_id);
        write.setA_id(a_id);
        write.setA_code(a_code);
        write.setC_code(c_code);
        write.setD_date(d_date);
        write.setM_amount(m_amount);
        write.setM_memo(m_memo);

        writeService.insertRow(write);
    }

    @ResponseBody
    @RequestMapping("/update")
    public void update(@RequestParam int m_id, @RequestParam int me_id, @RequestParam String c_code, @RequestParam String d_date, @RequestParam int m_amount, @RequestParam String m_memo) {
        getDate(me_id, d_date);

        MonthTableDto.Update monthWriteDto = new MonthTableDto.Update();
        monthWriteDto.setM_id(m_id);
        monthWriteDto.setC_code(c_code);
        monthWriteDto.setD_date(d_date);
        monthWriteDto.setM_amount(m_amount);
        monthWriteDto.setM_memo(m_memo);
        writeService.updateRow(monthWriteDto);
    }

    @ResponseBody
    @PostMapping("/delete")
    public void deleteRow(@RequestParam int m_id) {
        writeService.deleteRow(m_id);
    }

    private void getDate(int me_id, String d_date) {
        MonthTableDto.getDate mg = new MonthTableDto.getDate();
        mg.setD_date(d_date);
        mg.setM_id(me_id);
        writeService.getDate(mg);
    }
}