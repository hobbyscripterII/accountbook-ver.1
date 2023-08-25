package com.accountbook.project.domain.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.domain.domain.Income;
import com.accountbook.project.mapper.IncomeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class AccountBookController {
    private final IncomeMapper incomeMapper;

    @GetMapping("/month")
    public String AccountBook(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        List<Income> income = incomeMapper.selectIncome(session.getAttribute(SessionConst.MEMBER_ID));
        model.addAttribute("income", income);
        log.info("income = {}", income);
        return "accountbook";
    }
}