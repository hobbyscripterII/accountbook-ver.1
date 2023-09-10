package com.accountbook.project.month.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.month.dto.MonthCategoryDto;
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

        tableInfo(model, map);

        return "month";
    }

    public void tableInfo(Model model, Map<String, Object> map) {
        // 테이블 정보가 담겨있는 List를 담는다.
        List<MonthCategoryDto.TableInfo> table = monthTableService.getTableInfo(map);
        Map<String, List<MonthCategoryDto.TableInfo>> temp = new HashMap<String, List<MonthCategoryDto.TableInfo>>();
        // 카테고리를 분류하기위해 카테고리 식별코드를 배열로 담는다.
        String[] categoryCodeArray = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N"};

        for(String categoryCode : categoryCodeArray)
            // key: categoryCode value: List<tableInfo>
            temp.put(categoryCode, new ArrayList<MonthCategoryDto.TableInfo>());

        for(MonthCategoryDto.TableInfo dto : table) {
            String categoryCode = dto.getC_code();
            for(String categoryCode_ : categoryCodeArray) {
                // dto.getC_code에 담긴 값이 배열에 담긴 값일 경우 카테고리 식별코드와 일치하는 key를 꺼내 데이터를 담는다.
                if(categoryCode.contains(categoryCode_))
                    temp.get(categoryCode_).add(dto);
            }
        }

        model.addAttribute("income", temp.get("A"));
        model.addAttribute("fix", temp.get("B"));
        model.addAttribute("nonFixFood", temp.get("C"));
        model.addAttribute("nonFixLife", temp.get("D"));
        model.addAttribute("nonFixTraffic", temp.get("E"));
        model.addAttribute("nonFixRegular", temp.get("F"));
        model.addAttribute("nonFixFashion", temp.get("G"));
        model.addAttribute("nonFixBeauty", temp.get("H"));
        model.addAttribute("nonFixPhrase", temp.get("I"));
        model.addAttribute("nonFixEdu", temp.get("J"));
        model.addAttribute("nonFixCulture", temp.get("K"));
        model.addAttribute("nonFixHealth", temp.get("L"));
        model.addAttribute("nonFixEtc", temp.get("M"));
        model.addAttribute("save", temp.get("N"));
    }
}