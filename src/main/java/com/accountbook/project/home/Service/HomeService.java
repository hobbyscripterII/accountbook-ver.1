package com.accountbook.project.home.Service;

import com.accountbook.project.home.Dto.HomeDto;
import com.accountbook.project.home.Mapper.HomeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class HomeService {
    private final HomeMapper homeMapper;

    public HomeDto getName(int m_id) {
        return homeMapper.getName(m_id);
    }
}
