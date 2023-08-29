package com.accountbook.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Month {
    private int m_id;
    private int a_id;
    private String c_code;
    private String d_date;
    private int m_amount;
    private String m_memo;

    private String c_name;
}
