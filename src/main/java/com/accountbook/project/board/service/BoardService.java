package com.accountbook.project.board.service;

import com.accountbook.project.SessionConst;
import com.accountbook.project.board.dto.BoardDto;
import com.accountbook.project.board.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper boardMapper;
    private final BoardCommentService boardCommentService;
    private final BoardLikeService boardLikeService;

    public List<BoardDto.GetName> getName(int m_id) { return boardMapper.getName(m_id); }
    public void insertBoard(BoardDto.Insert board) { boardMapper.insertBoard(board); }
    public void deleteContent(int b_id) { boardMapper.deleteContent(b_id); }
    public void updateContent(BoardDto.UpdateContent board) { boardMapper.updateContent(board); }
    public void updateContentCnt(int b_id) { boardMapper.updateContentCnt(b_id); }
    public int getContentCnt() { return boardMapper.getContentCnt(); }
    public BoardDto.AccessFlag accessFlag(int b_id) {return boardMapper.accessFlag(b_id);}

    public List<BoardDto.SelectContent> selectContent(int b_id, int b_code) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("b_id", b_id);
        map.put("b_code", b_code);
        return boardMapper.selectContent(map);
    }

    // 게시판 목록(페이지네이션)
    public List<BoardDto.GetContent> getContent(int begin, int end, int b_code) {
        Map<String, Integer> map = new HashMap<String ,Integer>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("b_code", b_code);
        return boardMapper.getContent(map);
    }

    // 게시판 정보
    public void getBoard(int b_id, int b_code, Model model, HttpServletRequest request) {

        model.addAttribute("list", selectContent(b_id, b_code));
        model.addAttribute("flag", accessFlag(b_id));
        model.addAttribute("name", getName(getId(request)));
        model.addAttribute("comment", boardCommentService.getComment(b_id));
        model.addAttribute("heart", boardLikeService.getHeart(b_id, getId(request))); // 게시글 좋아요 여부
    }

    public int getId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (Integer) session.getAttribute(SessionConst.MEMBER_ID);
    }
}