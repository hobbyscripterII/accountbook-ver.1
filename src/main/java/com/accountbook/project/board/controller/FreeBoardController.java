package com.accountbook.project.board.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.board.dto.BoardDto;
import com.accountbook.project.board.service.BoardService;
import com.accountbook.project.pagination.PaginationDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
        List<BoardDto.GetContent> content = boardService.getContent(paginationDto.getBegin(), paginationDto.getEnd(), 2);
        model.addAttribute("content", content);
        model.addAttribute("paging", paginationDto);
        boardInfo(model);
        return "board/board";
    }

    @GetMapping("/list/{n_id}")
    public String board(@PathVariable(name = "n_id") int n_id, Model model) {
        boardService.updateContentCnt(n_id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("n_id", n_id);
        map.put("b_code", 2);
        List<BoardDto.SelectContent> list = boardService.selectContent(map);
        BoardDto.ModifyFlag flag = boardService.modifyFlag(n_id);
        model.addAttribute("list", list);
        model.addAttribute("flag", flag);
        boardInfo(model);
        return "board/board-read";
    }

    @GetMapping("/write")
    public String board(Model model, HttpServletRequest request) {
        List<BoardDto.GetName> name = boardService.getName(getId(request));
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
    public void delete(@RequestParam int n_id) {
        boardService.deleteContent(n_id);
    }

    @GetMapping("/update/{n_id}")
    public String update(@PathVariable(name = "n_id") int n_id, Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("n_id", n_id);
        map.put("b_code", 2);
        List<BoardDto.SelectContent> list = boardService.selectContent(map);
        model.addAttribute("list", list);
        boardInfo(model);
        return "board/board-update";
    }

    @ResponseBody
    @PostMapping("/update")
    public void update(BoardDto.UpdateContent board, @RequestParam int n_id, @RequestParam String n_title, @RequestParam String n_content) {
        board.setN_id(n_id);
        board.setN_title(n_title);
        board.setN_content(n_content);
        boardService.updateContent(board);
    }

    private static void boardInfo(Model model) {
        model.addAttribute("title", "자유 게시판");
        model.addAttribute("boardName", "free");
    }

    private static int getId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (Integer) session.getAttribute(SessionConst.MEMBER_ID);
    }
}
