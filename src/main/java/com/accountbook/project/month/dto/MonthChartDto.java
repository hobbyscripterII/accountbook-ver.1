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
}
