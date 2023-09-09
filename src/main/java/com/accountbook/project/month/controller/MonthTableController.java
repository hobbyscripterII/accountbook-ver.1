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

        model.addAttribute("category", monthTableService.getMonthCategory()); // 가계부 카테고리
        model.addAttribute("list", monthTableService.getMonthCode(ID)); // 회원이 등록한 가계부 일련코드 목록
        model.addAttribute("accountBook", monthTableService.selectMonth(map)); // 회원이 선택한 가계부 일련코드
        model.addAttribute("table", monthTableService.getMonth(map)); // 회원이 입력한 가계부 정보

        model.addAttribute("income", monthTableService.getIncome(map));
        model.addAttribute("save", monthTableService.getSave(map));
        model.addAttribute("fix", monthTableService.getFix(map));
        model.addAttribute("nonFixFood", monthTableService.getNonFixFood(map));
        model.addAttribute("nonFixLife", monthTableService.getNonFixLife(map));
        model.addAttribute("nonFixTraffic", monthTableService.getNonFixTraffic(map));
        model.addAttribute("nonFixRegular", monthTableService.getNonFixRegular(map));
        model.addAttribute("nonFixFashion", monthTableService.getNonFixFashion(map));
        model.addAttribute("nonFixBeauty", monthTableService.getNonFixBeauty(map));
        model.addAttribute("nonFixPhrase", monthTableService.getNonFixPhrase(map));
        model.addAttribute("nonFixEdu", monthTableService.getNonFixEdu(map));
        model.addAttribute("nonFixCulture", monthTableService.getNonFixCulture(map));
        model.addAttribute("nonFixHealth", monthTableService.getNonFixHealth(map));
        model.addAttribute("nonFixEtc", monthTableService.getNonFixEtc(map));
        return "month";
    }
}