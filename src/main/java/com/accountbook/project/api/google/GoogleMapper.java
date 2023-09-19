package com.accountbook.project.api.google;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface GoogleMapper {
    int getId(String id);
    String getGoogleId(String id);
    void insertGoogleId(Map<String, Object> map);
}