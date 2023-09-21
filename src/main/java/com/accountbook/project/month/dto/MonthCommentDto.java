package com.accountbook.project.month.dto;

import lombok.Builder;

public class MonthCommentDto {
    @Builder
    public static class Insert {
        private int b_id;
        private int m_id;
        private String c_content;
    }
}
