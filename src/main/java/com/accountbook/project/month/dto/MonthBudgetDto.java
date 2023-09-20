package com.accountbook.project.month.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MonthBudgetDto {
    private int b_id;
    private int me_id;
    private String b_cover;
    private int b_fix;
    private int b_nonfix;
    private String b_create_date;

    @Getter
    @Setter
    @ToString
    public static class insertBudgetDto {
        private int me_id;
        private String b_cover;
        private int b_fix;
        private int b_nonfix;

        public insertBudgetDto(int me_id, String b_cover, int b_fix, int b_nonfix) {
            this.me_id = me_id;
            this.b_cover = b_cover;
            this.b_fix = b_fix;
            this.b_nonfix = b_nonfix;
        }
    }

    @Getter
    @Setter
    @ToString
    public static class selectBudgetDto {
        private int me_id;
        private String b_cover;

        public selectBudgetDto(int me_id, String b_cover) {
            this.me_id = me_id;
            this.b_cover = b_cover;
        }
    }
}