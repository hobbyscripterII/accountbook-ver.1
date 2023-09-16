package com.accountbook.project.board.mapper;

import com.accountbook.project.board.dto.BoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardMapper {
    void insertBoard(BoardDto.Insert notice);
    List<BoardDto.GetContent> getContent(Map<String, Integer> map);
    List<BoardDto.SelectContent> selectContent(Map<String, Object> map);
    void updateContent(BoardDto.UpdateContent notice);
    BoardDto.AccessFlag accessFlag(int b_id);

    List<BoardDto.GetName> getName(int m_id);
    void deleteContent(int b_id);
    void updateContentCnt(int b_id);
    int getContentCnt();
}