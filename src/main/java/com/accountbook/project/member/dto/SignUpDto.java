package com.accountbook.project.member.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Getter
@Setter
public class SignUpDto {
    @NotEmpty(message = "이메일을 입력해주세요.")
    @Email(message = "이메일 형식에 맞춰 입력해주세요.")
    private String m_email;
    @NotEmpty(message = "패스워드를 입력해주세요.")
    private String m_pwd;
    @Size(min = 2, max = 6, message = "닉네임은 2~6자리로 입력해주세요.")
    private String m_name;
}
