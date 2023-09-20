package com.accountbook.project.month.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.month.dto.MonthBudgetDto;
import com.accountbook.project.month.service.MonthBudgetService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MonthBudgetController {
    private final MonthBudgetService monthBudgetService;

    @PostMapping("/update-budget")
    @ResponseBody
    public void updateBudget(@RequestParam int b_fix, @RequestParam int b_nonfix, @RequestParam String b_cover, HttpServletRequest request) {
        monthBudgetService.updateBudget(b_fix, b_nonfix, getId(request), b_cover);
    }

    public int getId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (Integer) session.getAttribute(SessionConst.MEMBER_ID);
    }
}