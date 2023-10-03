package com.accountbook.project.month.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

public class MonthCategoryDto {
    @Getter
    @ToString
    public static class Select {
        private int c_id;
        private int m_id;
        private String c_code;
        private String c_name;
        private String c_role;
    }

    @Getter
    @AllArgsConstructor
    public static class Insert {
        private int m_id;
        private String c_name;
    }
}