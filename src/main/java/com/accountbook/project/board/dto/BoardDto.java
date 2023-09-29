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
        private String b_create_date;
    }

    @Getter
    @Setter
    @ToString
    public static class Insert {
        private int m_id;
        private int b_code;
        private String b_title;
        private String b_content;
        private String b_alt;
    }

    @Getter
    @Setter
    @ToString
    public static class GetContent {
        private int b_id;
        private int b_code;
        private String m_name;
        private String b_title;
        private String b_create_date;
        private int h_cnt;
        private int b_view;
        private String b_alt; // 공지글 여부
        private String m_id; // 질문글 접속 플래그
    }

    @Getter
    @Setter
    @ToString
    public static class SelectContent {
        private int b_id;
        private int b_code;
        private int m_id;
        private String m_name;
        private String b_title;
        private String b_content;
        private String b_create_date;
        private int b_view;
        private String b_alt;
    }

    @Getter
    @Setter
    @ToString
    public static class UpdateContent {
        private int b_id;
        private String b_title;
        private String b_content;
        private String b_alt;
    }

    @Getter
    @Setter
    @ToString
    public static class AccessFlag {
        private int b_id;
        private int m_id;
        private String b_alt;
    }
}