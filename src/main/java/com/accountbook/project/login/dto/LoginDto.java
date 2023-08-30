package com.accountbook.project.login.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginDto {
    private int m_id;
    private String m_email;
    private String m_pwd;
}
