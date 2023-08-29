package com.accountbook.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Month {
    private int m_id; // 월별 가계부 seq
    private Integer me_id; // 회원 아이디
    private int a_id; // 가계부 seq
    private int a_code; // 가계부 일련코드
    private String c_code; // 가계부 카테고리 식별코드
    private String d_date; // 가계부 년월일자
    private int m_amount; // 금액
    private String m_memo; // 메모

    // join
    private String c_name; // 가계부 카테고리명
}