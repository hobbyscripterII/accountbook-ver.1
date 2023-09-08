package com.accountbook.project.pagination;

import lombok.ToString;

@ToString
public class PaginationDto {
    private final int pageNum = 10;     // 페이지당 게시글 갯수
    private final int btnNum = 5;       // 버튼 갯수
    private int page;                   // 현재 페이지 번호
    private int totalRecord;            // 전체 게시글 갯수
    private int totalPage;              // 전체 페이지 갯수
    private int begin;                  // 페이지 첫번째 게시글 번호
    private int end;                    // 페이지 마지막 게시글 번호
    private int beginPage;              // 블럭 시작 페이지
    private int endPage;                // 블럭 끝 페이지

    public PaginationDto(int page, int totalRecord) {
        setPage(page);
        setTotalRecord(totalRecord);

        calTotalPage(getTotalRecord(), getPageNum());
        calEndBegin(getPage(), getPageNum(), getTotalRecord());
        calEndBeginPage(getPage(), getTotalPage());
    }

    // totalPage
    public void calTotalPage(int totalRecord, int pageNum) {
        totalPage = totalRecord / pageNum;
        if (totalRecord % pageNum > 0)
            totalPage++;

        setTotalPage(totalPage);
    }

    // end, begin
    public void calEndBegin(int page, int pageNum, int totalRecord) {
        end = page * pageNum;

        begin = end - pageNum + 1;
        setBegin(begin);

        if (end > totalRecord)
            end = totalRecord;

        setEnd(end);
    }

    // beginPage, endPage
    public void calEndBeginPage(int page, int totalPage) {
        beginPage = (page - 1) / btnNum * btnNum + 1;
        setBeginPage(beginPage);
        endPage = beginPage + btnNum - 1;
        if (endPage > totalPage)
            endPage = totalPage;

        setEndPage(endPage);
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageNum() {
        return pageNum;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
}