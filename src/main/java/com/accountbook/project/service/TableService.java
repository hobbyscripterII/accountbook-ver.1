package com.accountbook.project.service;

import com.accountbook.project.domain.Table;
import com.accountbook.project.mapper.TableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TableService {
    private final TableMapper tableMapper;

    List<Table> selectIncome(Table table) {
        return tableMapper.selectIncome(table);
    }

    List<Table> selectFix(Table table) {
        return tableMapper.selectFix(table);
    }

    List<Table> selectNonFix(Table table) {
        return tableMapper.selectNonFix(table);
    }
}
