package com.accountbook.project.month.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.month.dto.MonthBudgetDto;
import com.accountbook.project.month.service.MonthBudgetService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class MonthBudgetController {
    private final MonthBudgetService monthBudgetService;

    @PostMapping("/insert-budget")
    @ResponseBody
    public void budget(@ModelAttribute MonthBudgetDto.insertBudgetDto insertBudgetDto, HttpServletRequest request) {
        insertBudgetDto.setMe_id(getId(request));
        monthBudgetService.insertBudget(insertBudgetDto);
    }

    public int getId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (Integer)session.getAttribute(SessionConst.MEMBER_ID);
    }
}
