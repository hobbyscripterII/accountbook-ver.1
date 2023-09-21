package com.accountbook.project.accountbook.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.accountbook.dto.AccountBookDto;
import com.accountbook.project.accountbook.service.AccountBookService;
import com.accountbook.project.month.dto.MonthBudgetDto;
import com.accountbook.project.month.service.MonthBudgetService;
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
@RequestMapping("/ac")
@RequiredArgsConstructor
public class AccountBookController {
    private final AccountBookService accountBookService;
    private final MonthBudgetService monthBudgetService;

    @GetMapping("/home")
    public String accountBook(HttpServletRequest request, Model model) {
        List<AccountBookDto> list = accountBookService.getACode(getId(request));
        model.addAttribute("list", list);
        return "accountbook";
    }

    @ResponseBody
    @PostMapping("/insert")
    public void insertMonth(@RequestParam int a_code, HttpServletRequest request) {
        AccountBookDto.Insert insert = new AccountBookDto.Insert(a_code, getId(request));
        accountBookService.insertAccountBook(insert);

        // 가계부 등록시 기초 예산 금액이 없으면 0으로 초기화해서 INSERT한다.
        monthBudgetService.selectBudget(getId(request));
    }

    @ResponseBody
    @PostMapping("/delete")
    public void deleteMonth(@RequestParam int a_code, HttpServletRequest request) {
        AccountBookDto.Delete delete = new AccountBookDto.Delete(getId(request), a_code);
        accountBookService.deleteMonth(delete);
        accountBookService.deleteAccountBook(delete);
    }

    public int getId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (Integer) session.getAttribute(SessionConst.MEMBER_ID);
    }
}