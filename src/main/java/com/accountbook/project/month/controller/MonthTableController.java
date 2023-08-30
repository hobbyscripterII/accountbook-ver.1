package com.accountbook.project.month.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.month.dto.MonthCategoryDto;
import com.accountbook.project.month.dto.MonthCodeDto;
import com.accountbook.project.month.dto.MonthTableDto;
import com.accountbook.project.month.service.MonthTableService;
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
@RequestMapping("/mt")
@RequiredArgsConstructor
public class MonthTableController {
    private final MonthTableService monthTableService;

    @GetMapping("/{m_id}/{a_code}")
    public String month(@PathVariable("m_id") int m_id, @PathVariable("a_code") int a_code, HttpServletRequest request, Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        HttpSession session = request.getSession();
        int ID = (Integer) session.getAttribute(SessionConst.MEMBER_ID);

        map.put("m_id", m_id);
        map.put("me_id", m_id);
        map.put("a_code", a_code);

        List<MonthCategoryDto> category = monthTableService.getMonthCategory(); // 가계부 카테고리
        List<MonthCodeDto> list = monthTableService.getMonthCode(ID); // 회원이 등록한 가계부 일련코드 목록
        List<MonthCodeDto> accountBook = monthTableService.selectMonth(map); // 회원이 선택한 가계부 일련코드
        List<MonthTableDto> table = monthTableService.getMonth(map); // 회원이 입력한 가계부 정보

        log.info("list = {}", list);
        log.info("table = {}", table);

        model.addAttribute("table", table);
        model.addAttribute("accountBook", accountBook);
        model.addAttribute("category", category);
        model.addAttribute("list", list);

        return "month";
    }
}