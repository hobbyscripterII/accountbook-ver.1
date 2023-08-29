package com.accountbook.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member {
    private int m_id;
    private String m_email;
    private String m_pwd;
    private String m_name;
}