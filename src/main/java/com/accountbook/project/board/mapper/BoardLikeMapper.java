package com.accountbook.project.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface BoardLikeMapper {
    void insertHeart(Map<String, Object> map);
    void deleteHeart(Map<String, Object> map);
    int getHeart(Map<String, Object> map);
    int getHeartCnt(int b_id);
}