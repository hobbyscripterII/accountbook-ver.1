package com.accountbook.project.notice.mapper;

import com.accountbook.project.notice.dto.NoticeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface NoticeMapper {
    List<NoticeDto.GetName> getName(int m_id);
    void insertNotice(NoticeDto.Insert notice);
    List<NoticeDto.SelectContent> selectContent(int n_id);
    void deleteContent(int n_id);
    void updateContent(NoticeDto.UpdateContent notice);
    void updateContentCnt(int n_id);
    int getContentCnt();
    NoticeDto.ModifyFlag modifyFlag(int n_id);

    List<NoticeDto.GetContent> getContent(Map<String, Integer> map);
}