package com.accountbook.project.notice.service;

import com.accountbook.project.notice.dto.NoticeDto;
import com.accountbook.project.notice.mapper.NoticeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class NoticeService {
    private final NoticeMapper noticeMapper;

    public List<NoticeDto.GetName> getName(int m_id) { return noticeMapper.getName(m_id); }
    public void insertNotice(NoticeDto.Insert notice) { noticeMapper.insertNotice(notice); }
    public List<NoticeDto.SelectContent> selectContent(int n_id) { return noticeMapper.selectContent(n_id); }
    public void deleteContent(int n_id) { noticeMapper.deleteContent(n_id); }
    public void updateContent(NoticeDto.UpdateContent notice) { noticeMapper.updateContent(notice); }
    public void updateContentCnt(int n_id) { noticeMapper.updateContentCnt(n_id); }
    public int getContentCnt() { return noticeMapper.getContentCnt(); }
    public NoticeDto.ModifyFlag modifyFlag(int n_id) {return noticeMapper.modifyFlag(n_id);}

    public List<NoticeDto.GetContent> getContent(int begin, int end) {
        Map<String, Integer> map = new HashMap<String ,Integer>();
        map.put("begin", begin);
        map.put("end", end);
        return noticeMapper.getContent(map);
    }
}