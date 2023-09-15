package com.accountbook.project.board.service;

import com.accountbook.project.board.dto.BoardCommentDto;
import com.accountbook.project.board.mapper.BoardCommentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardCommentService {
    private final BoardCommentMapper boardCommentMapper;

    public List<BoardCommentDto> getComment(int b_id) {
        return boardCommentMapper.getComment(b_id);
    }
    public BoardCommentDto.getComment selectComment(int c_id) { return boardCommentMapper.selectComment(c_id); }
    public void insertComment(Map<String, Object> map) { boardCommentMapper.insertComment(map); }
    public void updateComment(Map<String, Object> map) { boardCommentMapper.updateComment(map); }
    public void deleteComment(int c_id) { boardCommentMapper.deleteComment(c_id); }
}