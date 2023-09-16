package com.accountbook.project.board.controller;

import com.accountbook.project.board.dto.BoardDto;
import com.accountbook.project.board.service.BoardCommentService;
import com.accountbook.project.board.service.BoardService;
import com.accountbook.project.pagination.PaginationDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeBoardController {
    private final BoardService boardService;
    private final BoardCommentService boardCommentService;

    @GetMapping("/list")
    public String board(Model model, @RequestParam(defaultValue = "1") int page) {
        PaginationDto paginationDto = new PaginationDto(page, boardService.getContentCnt());
        model.addAttribute("content", boardService.getContent(paginationDto.getBegin(), paginationDto.getEnd(), 1));
        model.addAttribute("paging", paginationDto);
        boardInfo(model);
        return "board/board";
    }

    @GetMapping("/list/{b_id}")
    public String board(@PathVariable(name = "b_id") int b_id, Model model) {
        boardService.updateContentCnt(b_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("b_id", b_id);
        map.put("b_code", 1);
        getBoard(b_id, model, map);
        boardInfo(model);
        return "board/board-read";
    }

    @GetMapping("/write")
    public String board(Model model, HttpServletRequest request) {
        model.addAttribute("name", boardService.getName(boardService.getId(request)));
        boardInfo(model);
        return "board/board-write";
    }

    @PostMapping("/write")
    public String insert(@ModelAttribute BoardDto.Insert board) {
        board.setB_code(1);
        boardService.insertBoard(board);
        return "redirect:list";
    }

    @ResponseBody
    @PostMapping("/delete")
    public void delete(@RequestParam int b_id) {
        boardService.deleteContent(b_id);
    }

    @GetMapping("/update/{b_id}")
    public String update(@PathVariable(name = "b_id") int b_id, Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("b_id", b_id);
        map.put("b_code", 1);
        model.addAttribute("list", boardService.selectContent(map));
        boardInfo(model);
        return "board/board-update";
    }

    @ResponseBody
    @PostMapping("/update")
    public void update(@ModelAttribute BoardDto.UpdateContent board) {
        boardService.updateContent(board);
    }

    public void getBoard(int b_id, Model model, Map<String, Object> map) {
        model.addAttribute("list", boardService.selectContent(map));
        model.addAttribute("flag", boardService.accessFlag(b_id));
        model.addAttribute("comment", boardCommentService.getComment(b_id));
    }

    private static void boardInfo(Model model) {
        model.addAttribute("title", "공지사항");
        model.addAttribute("boardName", "notice");
    }
}