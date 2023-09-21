package com.accountbook.project.accountbook.dto;

import lombok.*;

@Getter
@Setter
@ToString
public class AccountBookDto {
    private int a_id;
    private int m_id;
    private String a_code;

    @AllArgsConstructor
    public static class Insert {
        private int a_code;
        private int m_id;
    }

    @AllArgsConstructor
    public static class Delete {
        private int m_id;
        private int a_code;
    }
}