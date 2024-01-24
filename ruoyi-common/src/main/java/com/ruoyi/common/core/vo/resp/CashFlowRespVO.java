package com.ruoyi.common.core.vo.resp;

public class CashFlowRespVO {

    /** 总流水收入金额 */
    private Float totalAmount;

    /** 手续费收入金额 */
    private Float commissionAmount;

    /** 手续费收入金额 */
    private Float todayTotalAmount;

    /** 手续费收入金额 */
    private Float yesterdayTotalAmount;

    public Float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Float getCommissionAmount() {
        return commissionAmount;
    }

    public void setCommissionAmount(Float commissionAmount) {
        this.commissionAmount = commissionAmount;
    }

    public Float getTodayTotalAmount() {
        return todayTotalAmount;
    }

    public void setTodayTotalAmount(Float todayTotalAmount) {
        this.todayTotalAmount = todayTotalAmount;
    }

    public Float getYesterdayTotalAmount() {
        return yesterdayTotalAmount;
    }

    public void setYesterdayTotalAmount(Float yesterdayTotalAmount) {
        this.yesterdayTotalAmount = yesterdayTotalAmount;
    }
}
