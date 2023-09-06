package com.accountbook.project.notice.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeDto {
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
        private String n_title;
        private String n_content;
    }

    @Getter
    @Setter
    @ToString
    public static class GetContent {
        private int n_id;
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

//    @Getter
//    @Setter
//    @ToString
//    public static class UpdateContentCnt {
//        private int n_id;
//    }

    @Getter
    public static class ModifyFlag {
        private int n_id;
        private int m_id;
    }
}