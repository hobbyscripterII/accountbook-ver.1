package com.accountbook.project.month.controller;

import com.accountbook.project.month.dto.MonthCategoryDto;
import com.accountbook.project.month.service.MonthCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/ct")
@RequiredArgsConstructor
public class MonthCategoryController {
    private final MonthCategoryService monthCategoryService;

    @ResponseBody
    @GetMapping("/select")
    public List<MonthCategoryDto.Select> selectCategory(HttpServletRequest request) {
        return monthCategoryService.selectCategory(monthCategoryService.getId(request));
    }

    @ResponseBody
    @PostMapping("/insert")
    public void insertCategory(String c_code, String c_name, HttpServletRequest request) {
        monthCategoryService.insertCategory(c_code, c_name, request);
    }
}