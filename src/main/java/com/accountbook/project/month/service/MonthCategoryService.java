package com.accountbook.project.month.service;

import com.accountbook.project.SessionConst;
import com.accountbook.project.month.dto.MonthCategoryDto;
import com.accountbook.project.month.mapper.MonthCategoryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Service
@RequiredArgsConstructor
public class MonthCategoryService {
    private final MonthCategoryMapper monthCategoryMapper;

    public void insertCategory(String c_code, String c_name, HttpServletRequest request) {
        MonthCategoryDto.Insert insert = new MonthCategoryDto.Insert(getId(request), c_name);

        if (c_code.equals("A")) {
            monthCategoryMapper.insertIncome(insert);
        } else if (c_code.equals("B")) {
            monthCategoryMapper.insertSave(insert);
        } else if (c_code.equals("C")) {
            monthCategoryMapper.insertFix(insert);
        } else {
            monthCategoryMapper.insertNonfix(insert);
        }
    }

    public int getId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (Integer) session.getAttribute(SessionConst.MEMBER_ID);
    }
}
