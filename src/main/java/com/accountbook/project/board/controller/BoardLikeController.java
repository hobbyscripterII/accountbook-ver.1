package com.accountbook.project.board.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.board.service.BoardLikeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class BoardLikeController {
    private final BoardLikeService boardLikeService;

    @PostMapping("/like-insert")
    @ResponseBody
    public void insertHeart(@RequestParam int b_id, HttpServletRequest request) {
        boardLikeService.insertHeart(common(b_id, request));
    }

    @PostMapping("/like-delete")
    @ResponseBody
    public void deleteHeart(@RequestParam int b_id, HttpServletRequest request) {
        boardLikeService.deleteHeart(common(b_id, request));
    }

    public Map<String, Object> common(int b_id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("b_id", b_id);
        map.put("m_id", session.getAttribute(SessionConst.MEMBER_ID));
        return map;
    }
}