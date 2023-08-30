package com.accountbook.project.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.domain.Category;
import com.accountbook.project.domain.Month;
import com.accountbook.project.service.MonthService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    private final MonthService monthService;

    @GetMapping("/home")
    public String accountBook(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        int ID = (Integer) session.getAttribute(SessionConst.MEMBER_ID);
        List<Month> list = monthService.selectMonthList(ID); // 가계부 버튼

//        Map<String, Object> map = new HashMap<String, Object>();
//
//        map.put("m_id", ID);
//        map.put("a_code", 202308);
//        List<Month> accountBook = monthService.selectAccountBook(map);
//
//        map.put("me_id", ID);
//        List<Month> table = monthService.selectWriteTable(map);
//        List<Category> category = monthService.selectAllCategory();
//
//        log.info("table = {}", table);
//
//        model.addAttribute("table", table);
//        model.addAttribute("accountBook", accountBook);
//        model.addAttribute("category", category);
        model.addAttribute("list", list);
        return "accountbook";
    }
}