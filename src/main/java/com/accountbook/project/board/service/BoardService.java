package com.accountbook.project.board.service;

import com.accountbook.project.board.dto.BoardDto;
import com.accountbook.project.board.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper boardMapper;

    public List<BoardDto.GetName> getName(int m_id) { return boardMapper.getName(m_id); }
    public void insertNotice(BoardDto.Insert board) { boardMapper.insertNotice(board); }
    public List<BoardDto.SelectContent> selectContent(Map<String, Object> map) { return boardMapper.selectContent(map); }
    public void deleteContent(int n_id) { boardMapper.deleteContent(n_id); }
    public void updateContent(BoardDto.UpdateContent board) { boardMapper.updateContent(board); }
    public void updateContentCnt(int n_id) { boardMapper.updateContentCnt(n_id); }
    public int getContentCnt() { return boardMapper.getContentCnt(); }
    public BoardDto.ModifyFlag modifyFlag(int n_id) {return boardMapper.modifyFlag(n_id);}

    public List<BoardDto.GetContent> getContent(int begin, int end, int b_code) {
        Map<String, Integer> map = new HashMap<String ,Integer>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("b_code", b_code);
        return boardMapper.getContent(map);
    }
}