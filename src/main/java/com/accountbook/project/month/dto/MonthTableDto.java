package com.accountbook.project.month.dto;

import lombok.Getter;

public class MonthTableDto {
    @Getter
    public static class getCategory {
        private String c_code;
        private String c_name;
        private String c_role;
    }

    @Getter
    public static class getTable {
        private String c_code;
        private String c_name;
        private int m_amount;
    }
}