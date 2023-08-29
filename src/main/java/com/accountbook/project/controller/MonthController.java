package com.accountbook.project.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.domain.Month;
import com.accountbook.project.domain.MonthCategory;
import com.accountbook.project.service.MonthService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MonthController {
    private final MonthService monthService;

    @GetMapping("/month")
    public String AccountBook(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("m_id", (Integer) session.getAttribute(SessionConst.MEMBER_ID));
        map.put("a_id", 202308);

        List<Month> month = monthService.selectWriteTable(map);
        List<MonthCategory> category = monthService.selectAllCategory();
        model.addAttribute("month", month);
        model.addAttribute("category", category);

        return "accountbook";
    }
}