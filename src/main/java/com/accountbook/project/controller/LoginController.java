package com.accountbook.project.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.domain.Member;
import com.accountbook.project.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequiredArgsConstructor
public class LoginController {
    private final LoginService loginService;

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("member", new Member());
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute Member member, HttpServletRequest request) {
        Member loginMember = loginService.login(member.getM_email(), member.getM_pwd());
        if (loginMember != null) {
            HttpSession session = request.getSession();
            session.setAttribute(SessionConst.MEMBER_ID, loginMember.getM_id());
            log.info("session = {}", session);
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
