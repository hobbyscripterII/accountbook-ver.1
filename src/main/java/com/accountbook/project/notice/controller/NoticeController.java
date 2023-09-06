package com.accountbook.project.notice.controller;

import com.accountbook.project.SessionConst;
import com.accountbook.project.notice.dto.NoticeDto;
import com.accountbook.project.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {
    private final NoticeService noticeService;

    @GetMapping("/list")
    public String notice(@ModelAttribute NoticeDto.SelectContent notice, Model model) {
        List<NoticeDto.GetContent> list = noticeService.getContent();
        model.addAttribute("list", list);
        model.addAttribute("notice", notice);
        return "notice";
    }

    @GetMapping("/list/{n_id}")
    public String notice(@PathVariable(name = "n_id") int n_id, Model model) {
        noticeService.updateContentCnt(n_id);
        List<NoticeDto.SelectContent> list = noticeService.selectContent(n_id);
        NoticeDto.ModifyFlag flag = noticeService.modifyFlag(n_id);
        model.addAttribute("list", list);
        model.addAttribute("flag", flag);
        return "notice-read";
    }

    @GetMapping("/write")
    public String notice(Model model, HttpServletRequest request) {
        List<NoticeDto.GetName> name = noticeService.getName(getId(request));
        model.addAttribute("name", name);
        return "notice-write";
    }

    @PostMapping("/write")
    public String insert(@ModelAttribute NoticeDto.Insert notice) {
        noticeService.insertNotice(notice);
        return "redirect:list";
    }

    @ResponseBody
    @PostMapping("/delete")
    public void delete(@RequestParam int n_id) {
        noticeService.deleteContent(n_id);
    }

    @GetMapping("/update/{n_id}")
    public String update(@PathVariable(name = "n_id") int n_id, Model model) {
        List<NoticeDto.SelectContent> list = noticeService.selectContent(n_id);
        model.addAttribute("list", list);
        return "notice-update";
    }

    @ResponseBody
    @PostMapping("/update")
    public void update(NoticeDto.UpdateContent notice, @RequestParam int n_id, @RequestParam String n_title, @RequestParam String n_content) {
        notice.setN_id(n_id);
        notice.setN_title(n_title);
        notice.setN_content(n_content);
        noticeService.updateContent(notice);
    }

    private static int getId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (Integer) session.getAttribute(SessionConst.MEMBER_ID);
    }
}
