package com.accountbook.project.month.service;

import com.accountbook.project.month.dto.MonthCategoryDto;
import com.accountbook.project.month.dto.MonthCodeDto;
import com.accountbook.project.month.dto.MonthTableDto;
import com.accountbook.project.month.mapper.MonthTableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MonthTableService {
    private final MonthTableMapper monthMapper;

    public List<MonthCategoryDto> getMonthCategory() { return monthMapper.getMonthCategory(); }
    public List<MonthCodeDto> getMonthCode(int m_id) { return monthMapper.getMonthCode(m_id); }
    public List<MonthCodeDto> selectMonth(Map<String, Object> map) { return monthMapper.selectMonth(map); }
    public List<MonthTableDto> getMonth(Map<String, Object> map) { return monthMapper.getMonth(map);}
    public List<MonthCategoryDto.TableInfo> getIncome(Map<String, Object> map) {return monthMapper.getIncome(map);}
    public List<MonthCategoryDto.TableInfo> getSave(Map<String, Object> map) {return monthMapper.getSave(map);}
    public List<MonthCategoryDto.TableInfo> getFix(Map<String, Object> map) {return monthMapper.getFix(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixFood(Map<String, Object> map) {return monthMapper.getNonFixFood(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixLife(Map<String, Object> map) {return monthMapper.getNonFixLife(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixTraffic(Map<String, Object> map) {return monthMapper.getNonFixTraffic(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixRegular(Map<String, Object> map) {return monthMapper.getNonFixRegular(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixFashion(Map<String, Object> map) {return monthMapper.getNonFixFashion(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixBeauty(Map<String, Object> map) {return monthMapper.getNonFixBeauty(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixPhrase(Map<String, Object> map) {return monthMapper.getNonFixPhrase(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixEdu(Map<String, Object> map) {return monthMapper.getNonFixEdu(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixCulture(Map<String, Object> map) {return monthMapper.getNonFixCulture(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixHealth(Map<String, Object> map) {return monthMapper.getNonFixHealth(map);}
    public List<MonthCategoryDto.TableInfo> getNonFixEtc(Map<String, Object> map) {return monthMapper.getNonFixEtc(map);}
}