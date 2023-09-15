package com.accountbook.project.board.controller;

import com.accountbook.project.board.dto.BoardDto;
import com.accountbook.project.board.service.BoardService;
import com.accountbook.project.pagination.PaginationDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/free")
@RequiredArgsConstructor
public class FreeBoardController {
    private final BoardService boardService;

    @GetMapping("/list")
    public String board(Model model, @RequestParam(defaultValue = "1") int page) {
        PaginationDto paginationDto = new PaginationDto(page, boardService.getContentCnt());
        model.addAttribute("content", boardService.getContent(paginationDto.getBegin(), paginationDto.getEnd(), 2));
        model.addAttribute("paging", paginationDto);
        boardInfo(model);
        return "board/board";
    }

    @GetMapping("/list/{b_id}")
    public String board(@PathVariable(name = "b_id") int b_id, Model model, HttpServletRequest request) {
        boardService.updateContentCnt(b_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("b_id", b_id);
        map.put("b_code", 2);
        boardService.getBoard(b_id, model, request, map);
        boardInfo(model);
        return "board/board-read";
    }



    @GetMapping("/write")
    public String board(Model model, HttpServletRequest request) {
        List<BoardDto.GetName> name = boardService.getName(boardService.getId(request));
        model.addAttribute("name", name);
        boardInfo(model);
        return "board/board-write";
    }

    @PostMapping("/write")
    public String insert(@ModelAttribute BoardDto.Insert board) {
        board.setB_code(2);
        boardService.insertNotice(board);
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
        map.put("b_code", 2);
        List<BoardDto.SelectContent> list = boardService.selectContent(map);
        model.addAttribute("list", list);
        boardInfo(model);
        return "board/board-update";
    }

    @ResponseBody
    @PostMapping("/update")
    public void update(BoardDto.UpdateContent board, @RequestParam int b_id, @RequestParam String n_title, @RequestParam String n_content) {
        board.setB_id(b_id);
        board.setN_title(n_title);
        board.setN_content(n_content);
        boardService.updateContent(board);
    }

    public static void boardInfo(Model model) {
        model.addAttribute("title", "자유 게시판");
        model.addAttribute("boardName", "free");
    }
}
