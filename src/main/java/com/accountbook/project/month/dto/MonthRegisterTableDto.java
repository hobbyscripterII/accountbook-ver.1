package com.accountbook.project.month.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MonthRegisterTableDto {
    private int m_id;
    private int me_id;
    private int a_id;
    private int a_code;
    private String c_code;
    private String c_name;
    private String d_date;
    private int m_amount;
    private String m_memo;

    @Builder
    public static class Insert {
        private int me_id;
        private int a_id;
        private int a_code;
        private String c_code;
        private String d_date;
        private int m_amount;
        private String m_memo;
    }

    @Getter
    @Setter
    @ToString
    public static class Update {
        private int m_id;
        private String c_code;
        private String d_date;
        private int m_amount;
        private String m_memo;
    }

    @Getter
    @Setter
    @ToString
    public static class Delete {
        private int m_id;
    }
}
