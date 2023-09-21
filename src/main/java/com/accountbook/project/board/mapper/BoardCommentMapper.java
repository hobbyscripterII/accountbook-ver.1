package com.accountbook.project.board.mapper;

import com.accountbook.project.board.dto.BoardCommentDto;
import com.accountbook.project.month.dto.MonthCommentDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardCommentMapper {
    List<BoardCommentDto> getComment(int b_id);
    BoardCommentDto.selectComment selectComment(int c_id);
    void insertComment(MonthCommentDto.Insert insert);
    void updateComment(Map<String, Object> map);
    void deleteComment(int c_id);
}