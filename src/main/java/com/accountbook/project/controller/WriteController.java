package com.accountbook.project.controller;

import com.accountbook.project.domain.Write;
import com.accountbook.project.service.WriteService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequiredArgsConstructor
public class WriteController {
    private final WriteService writeService;

    @ResponseBody
    @RequestMapping("/delete")
    public void delete(@RequestParam int m_id) {
        writeService.deleteWriteTableRow(m_id);
    }

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(@RequestParam int m_id, @RequestParam int a_id, @RequestParam String c_code, @RequestParam String d_date, @RequestParam int m_amount, @RequestParam String m_memo) {
        Write checkDate = new Write();
        checkDate.setD_date(d_date);
        checkDate.setM_id(m_id);
        writeService.checkDate(checkDate);

        Write insertWriteTable = new Write();
        insertWriteTable.setA_id(a_id);
        insertWriteTable.setD_date(d_date);
        insertWriteTable.setC_code(c_code);
        insertWriteTable.setM_amount(m_amount);
        insertWriteTable.setM_memo(m_memo);
        writeService.insertWriteTable(insertWriteTable);
    }
}
