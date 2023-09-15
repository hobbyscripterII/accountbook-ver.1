package com.accountbook.project.board.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.board.service.BoardCommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/cmt")
@RequiredArgsConstructor
public class BoardCommentController {
    private final BoardCommentService boardCommentService;

    @PostMapping("/insert")
    @ResponseBody // C_ID, B_ID, M_ID, C_CONTENT, C_CREATE_DATE
    public void insertComment(@RequestParam int b_id, @RequestParam String c_content, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("b_id", b_id);
        map.put("m_id", getId(request));
        map.put("c_content", c_content);
        boardCommentService.insertComment(map);
    }

    private static int getId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (Integer) session.getAttribute(SessionConst.MEMBER_ID);
    }
}
