package com.accountbook.project.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.domain.Month;
import com.accountbook.project.domain.Category;
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

        // 해당 회원이 등록한 가계부 년월코드
        List<Month> list = monthService.selectMonthList(session.getAttribute(SessionConst.MEMBER_ID));

        // 회원 아이디와 가계부 년월코드를 찾아 해당 년월 가계부 정보를 출력한다.
        Map<String, Object> map = new HashMap<String, Object>();
        Map<String, Object> map_ = new HashMap<String, Object>();
        int me_id = (Integer) session.getAttribute(SessionConst.MEMBER_ID);

        map.put("m_id", me_id);
        map.put("a_code", 202308);
        List<Month> accountBook = monthService.selectAccountBook(map);

        map.put("me_id", me_id);
        List<Month> table = monthService.selectWriteTable(map);
        List<Category> category = monthService.selectAllCategory();

        model.addAttribute("table", table);
        model.addAttribute("accountBook", accountBook);
        model.addAttribute("category", category);
        model.addAttribute("list", list);

        return "accountbook";
    }
}