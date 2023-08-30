package com.accountbook.project.accountbook;

import com.accountbook.project.SessionConst;
import com.accountbook.project.month.dto.MonthCodeDto;
import com.accountbook.project.month.service.MonthTableService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/ac")
@RequiredArgsConstructor
public class AccountBookController {
    private final MonthTableService monthTableService;

    @GetMapping("/home")
    public String accountBook(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        int ID = (Integer) session.getAttribute(SessionConst.MEMBER_ID);
        List<MonthCodeDto> list = monthTableService.getMonthCode(ID);
        model.addAttribute("list", list);
        return "accountbook";
    }
}