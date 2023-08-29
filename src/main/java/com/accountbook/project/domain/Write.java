package com.accountbook.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class Write {
    private int m_id;
    private int a_id;
    private String c_code;
    private String d_date;
    private int m_amount;
    private String m_memo;
}
