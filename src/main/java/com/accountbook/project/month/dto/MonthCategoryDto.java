package com.accountbook.project.month.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MonthCategoryDto {
    private String c_code;
    private String c_name;

    @Getter
    @Setter
    @ToString
    public static class Income {
        private String c_name;
        private int m_amount;
        private int m_count;
    }
}