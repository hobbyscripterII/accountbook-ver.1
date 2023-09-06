package com.accountbook.project.notice.mapper;

import com.accountbook.project.notice.dto.NoticeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {
    List<NoticeDto.GetName> getName(int m_id);
    void insertNotice(NoticeDto.Insert notice);
    List<NoticeDto.GetContent> getContent();
    List<NoticeDto.SelectContent> selectContent(int n_id);
    void deleteContent(int n_id);
    void updateContent(NoticeDto.UpdateContent notice);
    void updateContentCnt(int n_id);

    NoticeDto.ModifyFlag modifyFlag(int n_id);
}