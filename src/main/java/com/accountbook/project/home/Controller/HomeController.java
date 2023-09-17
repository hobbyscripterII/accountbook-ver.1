package com.accountbook.project.home.Controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.home.Dto.HomeDto;
import com.accountbook.project.home.Service.HomeService;
import com.accountbook.project.login.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
    private final HomeService homeService;

    @GetMapping("/")
    public String home(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session != null) {
            int m_id = (Integer)session.getAttribute(SessionConst.MEMBER_ID);
            HomeDto homeDto = homeService.getName(m_id);
            model.addAttribute("name", homeDto.getM_name());
        }
        return "home";
    }
}