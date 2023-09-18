package com.accountbook.project.board.controller;

import com.accountbook.project.board.dto.BoardDto;
import com.accountbook.project.board.service.BoardLikeService;
import com.accountbook.project.board.service.BoardService;
//import com.accountbook.project.exception.QuestionException;
import com.accountbook.project.exception.QuestionException;
import com.accountbook.project.kakao.KakaoService;
import com.accountbook.project.pagination.PaginationDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/question")
@RequiredArgsConstructor
public class QuestionBoardController {
    private final BoardService boardService;
    private final BoardLikeService boardLikeService;

    @GetMapping("/list")
    public String board(Model model, @RequestParam(defaultValue = "1") int page) {
        PaginationDto paginationDto = new PaginationDto(page, boardService.getContentCnt());
        model.addAttribute("content", boardService.getContent(paginationDto.getBegin(), paginationDto.getEnd(), 3));
        model.addAttribute("paging", paginationDto);
        boardInfo(model);
        return "board/board";
    }


    @GetMapping("/list/{b_id}")
    public String board(@PathVariable(name = "b_id") int b_id, Model model, HttpServletRequest request) throws QuestionException {
        BoardDto.AccessFlag flag = boardService.accessFlag(b_id);
        int id = boardService.getId(request);
        if(id == flag.getM_id() || id == 1 || flag.getB_alt().equals("Y")) {
            boardService.getBoard(b_id,3, model, request);
            boardService.updateContentCnt(b_id);
            boardInfo(model);
        } else {
            throw new QuestionException();
        }
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
        board.setB_code(3);
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
        model.addAttribute("list", boardService.selectContent(b_id, 3));
        boardInfo(model);
        return "board/board-update";
    }

    @ResponseBody
    @PostMapping("/update")
    public void update(@ModelAttribute BoardDto.UpdateContent board) {
        boardService.updateContent(board);
    }

    public static void boardInfo(Model model) {
        model.addAttribute("title", "질문 게시판");
        model.addAttribute("boardName", "question");
    }
}
