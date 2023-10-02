package com.accountbook.project.month.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

public class MonthCategoryDto {
    @Getter
    @AllArgsConstructor
    @ToString
    public static class Insert {
        private int m_id;
        private String c_name;
    }
}