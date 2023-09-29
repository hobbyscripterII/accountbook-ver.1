package com.accountbook.project.member.controller;

import com.accountbook.project.member.dto.SignUpDto;
import com.accountbook.project.member.service.SignUpService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Slf4j
@Controller
@RequiredArgsConstructor
public class SignUpController {
    private final SignUpService signUpService;

    @GetMapping("/sign-up")
    public String signUp(Model model) {
        model.addAttribute("signUpDto", new SignUpDto());
        return "sign-up";
    }

    @PostMapping("/sign-up")
    public String signUp(@Valid @ModelAttribute SignUpDto signUpDto, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            log.info("bindingResult = {}", bindingResult);
            return "sign-up";
        } else {
            signUpService.signUp(signUpDto);
            return "redirect:sign-up-complete";
        }
    }

    @GetMapping("/sign-up-complete")
    public String signUpComplete() {
        return "sign-up-complete";
    }
}
