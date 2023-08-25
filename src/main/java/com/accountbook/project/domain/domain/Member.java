package com.accountbook.project.domain.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member {
    private int id;
    private String email;
    private String pwd;
    private String nickname;
}
