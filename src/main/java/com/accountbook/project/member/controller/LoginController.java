package com.accountbook.project.member.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.member.dto.LoginDto;
import com.accountbook.project.member.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequiredArgsConstructor
public class LoginController {
    private final LoginService loginService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute LoginDto loginDto, HttpServletRequest request) {
        LoginDto loginDto_ = loginService.login(loginDto.getM_email(), loginDto.getM_pwd());
        if (loginDto_ != null) {
            HttpSession session = request.getSession();
            session.setAttribute(SessionConst.MEMBER_ID, loginDto_.getM_id());
            loginService.updateVisitNum(loginDto_.getM_id());
            return "redirect:/";
        }
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }
}
