package com.accountbook.project.month.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.accountbook.service.AccountBookService;
import com.accountbook.project.month.dto.MonthTableDto;
import com.accountbook.project.month.service.MonthBudgetService;
import com.accountbook.project.month.service.MonthChartService;
import com.accountbook.project.month.service.MonthTableService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Slf4j
@Controller
@RequestMapping("/mt")
@RequiredArgsConstructor
public class MonthTableController {
    private final MonthTableService monthTableService;
    private final AccountBookService accountBookService;
    private final MonthChartService monthChartService;
    private final MonthBudgetService monthBudgetService;

    @GetMapping("/{m_id}/{a_code}")
    public String month(@PathVariable("m_id") int m_id, @PathVariable("a_code") int a_code, HttpServletRequest request, Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("m_id", m_id);
        map.put("a_code", a_code);
        model.addAttribute("category", monthTableService.getCategory()); // 가계부 카테고리
        model.addAttribute("list", accountBookService.getACode(getId(request))); // 회원이 등록한 가계부 일련코드 목록
        model.addAttribute("accountBook", accountBookService.getAccountBook(map)); // 회원이 선택한 가계부 일련코드
        model.addAttribute("table", monthTableService.getMonth(map)); // 회원이 입력한 가계부 정보
        model.addAttribute("member", monthChartService.getMemberMonthCategorySum(map));
        model.addAttribute("budget", monthBudgetService.selectBudget(m_id));

        monthBudgetService.selectBudget(m_id);
        tableInfo(model, map);

        return "month";
    }

    @GetMapping("/amount-compare")
    public String monthAmountCompare(Model model, HttpServletRequest request) {
        model.addAttribute("member", monthChartService.getMemberMonthCategoryAvg(getId(request)));
        model.addAttribute("notMember", monthChartService.getNotMemberMonthCategoryAvg(getId(request)));
        model.addAttribute("name", monthChartService.getName(getId(request)));
        return "amount-compare";
    }

    public void tableInfo(Model model, Map<String, Object> map) {
        // 테이블 정보가 담겨있는 List를 담는다.
        List<MonthTableDto.getTable> table = monthTableService.getTableInfo(map);
        Map<String, List<MonthTableDto.getTable>> temp = new HashMap<String, List<MonthTableDto.getTable>>();
        // 카테고리를 분류하기위해 카테고리 식별코드를 배열로 담는다.
        String[] categoryCodeArray = {"A", "B", "C", "D"};

        for(String categoryCode : categoryCodeArray)
            // key: categoryCode value: List<tableInfo>
            temp.put(categoryCode, new ArrayList<MonthTableDto.getTable>());

        for(MonthTableDto.getTable dto : table) {
            String categoryCode = dto.getC_code();
            for(String categoryCode_ : categoryCodeArray) {
                // dto.getC_code에 담긴 값이 배열에 담긴 값일 경우 카테고리 식별코드와 일치하는 key를 꺼내 데이터를 담는다.
                if(categoryCode.contains(categoryCode_))
                    temp.get(categoryCode_).add(dto);
            }
        }

        model.addAttribute("income", temp.get("A"));
        model.addAttribute("save", temp.get("B"));
        model.addAttribute("fix", temp.get("C"));
        model.addAttribute("nonFix", temp.get("D"));
    }

    private static int getId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (Integer) session.getAttribute(SessionConst.MEMBER_ID);
    }
}