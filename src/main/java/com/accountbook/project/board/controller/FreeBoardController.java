package com.accountbook.project.board.controller;

import com.accountbook.project.board.dto.BoardDto;
import com.accountbook.project.board.service.BoardLikeService;
import com.accountbook.project.board.service.BoardService;
import com.accountbook.project.pagination.PaginationDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequestMapping("/free")
@RequiredArgsConstructor
public class FreeBoardController {
    private final BoardService boardService;
    private final BoardLikeService boardLikeService;

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
        boardService.getBoard(b_id, 2, model, request);
        model.addAttribute("cnt", boardLikeService.getHeartCnt(b_id));
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
        if(board.getB_alt() == null) {
            board.setB_alt("N");
        }
        board.setB_code(2);
        boardService.insertBoard(board);
        return "redirect:list";
    }

    @ResponseBody
    @PostMapping("/delete")
    public void delete(@RequestParam int b_id) {
        boardLikeService.deleteAllHeart(b_id);
        boardService.deleteContent(b_id);
    }

    @GetMapping("/update/{b_id}")
    public String update(@PathVariable(name = "b_id") int b_id, Model model) {
        model.addAttribute("list", boardService.selectContent(b_id, 2));
        boardInfo(model);
        return "board/board-update";
    }

    @ResponseBody
    @PostMapping("/update")
    public void update(@ModelAttribute BoardDto.UpdateContent board) {
        boardService.updateContent(board);
    }

    public void boardInfo(Model model) {
        model.addAttribute("title", "자유 게시판");
        model.addAttribute("boardName", "free");
    }
}
