package com.accountbook.project.controller;

import com.accountbook.project.domain.Write;
import com.accountbook.project.service.WriteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequiredArgsConstructor
public class WriteController {
    private final WriteService writeService;

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(@RequestParam int me_id, @RequestParam int a_id, @RequestParam String a_code, @RequestParam String c_code, @RequestParam String d_date, @RequestParam int m_amount, @RequestParam String m_memo) {
        dateCheck(me_id, d_date);

        Write write = new Write();
        write.setMe_id(me_id);
        write.setA_id(a_id);
        write.setA_code(a_code);
        write.setC_code(c_code);
        write.setD_date(d_date);
        write.setM_amount(m_amount);
        write.setM_memo(m_memo);

        log.info("insert = {}", write);

        writeService.insertWriteTableRow(write);
    }

    @ResponseBody
    @RequestMapping("/update")
    public void update(@RequestParam int m_id, @RequestParam String c_code, @RequestParam String d_date, @RequestParam int m_amount, @RequestParam String m_memo) {
        dateCheck(m_id, d_date);
        Write write = new Write();
        write.setC_code(c_code);
        write.setD_date(d_date);
        write.setM_amount(m_amount);
        write.setM_memo(m_memo);
        writeService.updateWriteTableRow(write);
    }

    @ResponseBody
    @PostMapping("/delete")
    public void delete(@RequestParam int m_id) {
        writeService.deleteWriteTableRow(m_id);
    }

    private void dateCheck(int me_id, String d_date) {
        Write checkDate = new Write();
        checkDate.setD_date(d_date);
        checkDate.setM_id(me_id);
        writeService.checkDate(checkDate);
    }
}