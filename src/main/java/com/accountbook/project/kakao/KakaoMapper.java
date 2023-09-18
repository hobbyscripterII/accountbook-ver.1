package com.accountbook.project.kakao;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface KakaoMapper {
    long getId(long id);
    long getKakaoId(long id);
    void insertKakaoId(Map<String, Object> map);
}