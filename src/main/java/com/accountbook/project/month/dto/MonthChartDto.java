package com.accountbook.project.month.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MonthChartDto {
    private String category;
    private int amount;

    private int m_id;
    private int a_code;

    public MonthChartDto(int m_id, int a_code) {
        this.m_id = m_id;
        this.a_code = a_code;
    }

    @Getter
    @Setter
    @ToString
    public static class Info {
        private String c_code;
        private String c_name;
        private int m_amount;
    }
}
