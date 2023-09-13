package com.accountbook.project.month.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MonthTableDto {
    @Getter
    @Setter
    @ToString
    public static class getCategory {
        private String c_code;
        private String c_name;
    }

    @Getter
    @Setter
    @ToString
    public static class getTable {
        private String c_code;
        private String c_name;
        private int m_amount;
    }
}