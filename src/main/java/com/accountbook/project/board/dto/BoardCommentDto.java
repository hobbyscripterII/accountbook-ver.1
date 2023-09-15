package com.accountbook.project.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardCommentDto {
    private int c_id; // 댓글 아이디
    private int b_id; // 게시글 아이디
    private int m_id; // 회원 아이디
    private String m_name; // 회원 닉네임
    private String c_content;
    private String c_create_date;

//    @Getter
//    @Setter
//    @ToString
//    public static class GetName {
//        private int m_id;
//        private String m_name;
//        private String n_create_date;
//    }
}