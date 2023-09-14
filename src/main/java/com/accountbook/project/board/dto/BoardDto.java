package com.accountbook.project.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDto {
    @Getter
    @Setter
    @ToString
    public static class GetName {
        private int m_id;
        private String m_name;
        private String n_create_date;
    }

    @Getter
    @Setter
    @ToString
    public static class Insert {
        private int m_id;
        private int b_code;
        private String n_title;
        private String n_content;
    }

    @Getter
    @Setter
    @ToString
    public static class GetContent {
        private int n_id;
        private int b_code;
        private String m_name;
        private String n_title;
        private String n_create_date;
        private int n_view;
    }

    @Getter
    @Setter
    @ToString
    public static class SelectContent {
        private int n_id;
        private int b_code;
        private int m_id;
        private String m_name;
        private String n_title;
        private String n_content;
        private String n_create_date;
        private int n_view;
    }

    @Getter
    @Setter
    @ToString
    public static class UpdateContent {
        private int n_id;
        private String n_title;
        private String n_content;
    }

    @Getter
    public static class ModifyFlag {
        private int n_id;
        private int m_id;
    }
}