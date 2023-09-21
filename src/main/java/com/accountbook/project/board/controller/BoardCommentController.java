package com.accountbook.project.board.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.board.service.BoardCommentService;
import com.accountbook.project.board.service.BoardService;
import com.accountbook.project.month.dto.MonthCommentDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/cmt")
@RequiredArgsConstructor
public class BoardCommentController {
    private final BoardService boardService;
    private final BoardCommentService boardCommentService;

    @PostMapping("/insert")
    @ResponseBody
    public void insertComment(@RequestParam int b_id, @RequestParam String c_content, HttpServletRequest request) {
        MonthCommentDto.Insert insert = MonthCommentDto.Insert.builder()
                .b_id(b_id)
                .m_id(boardService.getId(request))
                .c_content(c_content)
                .build();

        boardCommentService.insertComment(insert);
    }

    @GetMapping("/update/{c_id}")
    public String selectComment(@PathVariable(name = "c_id") int c_id, Model model) {
        model.addAttribute("comment", boardCommentService.selectComment(c_id));
        return "/board/board-comment-update";
    }

    @PostMapping("/update")
    @ResponseBody
    public void updateComment(@RequestParam int c_id, @RequestParam String c_content) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("c_id", c_id);
        map.put("c_content", c_content);
        boardCommentService.updateComment(map);
    }

    @PostMapping("/delete")
    @ResponseBody
    public void deleteComment(@RequestParam int c_id) {
        boardCommentService.deleteComment(c_id);
    }
}
