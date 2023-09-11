package com.accountbook.project;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class HomeController {
    @GetMapping("/")
    public String home(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false);
        return "home";
    }
}