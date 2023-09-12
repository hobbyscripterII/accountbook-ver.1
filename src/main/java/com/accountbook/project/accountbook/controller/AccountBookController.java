package com.accountbook.project.accountbook.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.accountbook.dto.AccountBookDto;
import com.accountbook.project.accountbook.service.AccountBookService;
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

    @GetMapping("/home")
    public String accountBook(HttpServletRequest request, Model model) {
        List<AccountBookDto> list = accountBookService.getMonthCode(getId(request));
        model.addAttribute("list", list);
        return "accountbook";
    }

    @ResponseBody
    @PostMapping("/insert")
    public void insertMonth(@RequestParam int a_code, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("m_id", getId(request));
        map.put("a_code", a_code);
        accountBookService.insertMonth(map);
    }

    @ResponseBody
    @PostMapping("/delete")
    public void deleteMonth(@RequestParam int a_code, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("m_id", getId(request));
        map.put("me_id", getId(request));
        map.put("a_code", a_code);
        accountBookService.deleteMonth(map);
        accountBookService.deleteAccountBook(map);
    }

    public int getId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (Integer) session.getAttribute(SessionConst.MEMBER_ID);
    }
}