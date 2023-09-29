package com.accountbook.project.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class LoginDto {
    private int m_id;
    private String m_email;
    private String m_pwd;
}