package com.accountbook.project.domain.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Income {
    private int seq;
    private Integer id;
    private String category;
    private int amount;
}
