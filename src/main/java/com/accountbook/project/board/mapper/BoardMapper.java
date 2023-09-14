package com.accountbook.project.board.mapper;

import com.accountbook.project.board.dto.BoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardMapper {
    List<BoardDto.GetName> getName(int m_id);
    List<BoardDto.GetContent> getContent(Map<String, Integer> map);
    void insertNotice(BoardDto.Insert notice);
    List<BoardDto.SelectContent> selectContent(Map<String, Object> map);
    void deleteContent(int n_id);
    void updateContent(BoardDto.UpdateContent notice);
    void updateContentCnt(int n_id);
    int getContentCnt();
    BoardDto.ModifyFlag modifyFlag(int n_id);
}