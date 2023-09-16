package com.accountbook.project.board.service;

import com.accountbook.project.board.mapper.BoardLikeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardLikeService {
    private final BoardLikeMapper boardLikeMapper;

    public void insertHeart(Map<String, Object> map) {
        boardLikeMapper.insertHeart(map);
    }

    public void deleteHeart(Map<String, Object> map) {
        boardLikeMapper.deleteHeart(map);
    }

    public int getHeart(int b_id, int m_id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("b_id", b_id);
        map.put("m_id", m_id);
        return boardLikeMapper.getHeart(map);
    }

    public int getHeartCnt(int b_id) {
        return boardLikeMapper.getHeartCnt(b_id);
    }
}