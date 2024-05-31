package com.ruoyi.common.core.vo.resp;

import java.util.List;

public class HomePageDataRespVO {

    /** 市场交易总流水 */
    private Float totalAmount;

    /** 今天市场交易流水 */
    private Float todayTotalAmount;

    /** 昨日市场交易流水 */
    private Float yesterdayTotalAmount;

    /** 今天转账流水 */
    private Float todayTotalRechargeAmount;

    /** 市场交易标题 */
    private List<String> buySaleTransactionEchartTitle;

    /** 市场交易总流水内容 */
    private List<Float> totalTransactionEchartSeriesData;

    /** 市场交易入账内容 */
    private List<Float> buyTransactionEchartSeriesData;

    /** 市场交易出账内容 */
    private List<Float> saleTransactionEchartSeriesData;

    /** 转账标题 */
    private List<String> rechargeTransactionEchartTitle;

    /** 总转账交易内容 */
    private List<Float> totalRechargeTransactionEchartSeriesData;

    /** 转账交易入账内容 */
    private List<Float> fromRechargeTransactionEchartSeriesData;

    /** 转账交易出账内容 */
    private List<Float> toRechargeTransactionEchartSeriesData;

    public Float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Float getTodayTotalRechargeAmount() {
        return todayTotalRechargeAmount;
    }

    public void setTodayTotalRechargeAmount(Float todayTotalRechargeAmount) {
        this.todayTotalRechargeAmount = todayTotalRechargeAmount;
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

    public List<String> getBuySaleTransactionEchartTitle() {
        return buySaleTransactionEchartTitle;
    }

    public void setBuySaleTransactionEchartTitle(List<String> buySaleTransactionEchartTitle) {
        this.buySaleTransactionEchartTitle = buySaleTransactionEchartTitle;
    }

    public List<Float> getTotalTransactionEchartSeriesData() {
        return totalTransactionEchartSeriesData;
    }

    public void setTotalTransactionEchartSeriesData(List<Float> totalTransactionEchartSeriesData) {
        this.totalTransactionEchartSeriesData = totalTransactionEchartSeriesData;
    }

    public List<Float> getBuyTransactionEchartSeriesData() {
        return buyTransactionEchartSeriesData;
    }

    public void setBuyTransactionEchartSeriesData(List<Float> buyTransactionEchartSeriesData) {
        this.buyTransactionEchartSeriesData = buyTransactionEchartSeriesData;
    }

    public List<Float> getSaleTransactionEchartSeriesData() {
        return saleTransactionEchartSeriesData;
    }

    public void setSaleTransactionEchartSeriesData(List<Float> saleTransactionEchartSeriesData) {
        this.saleTransactionEchartSeriesData = saleTransactionEchartSeriesData;
    }

    public List<String> getRechargeTransactionEchartTitle() {
        return rechargeTransactionEchartTitle;
    }

    public void setRechargeTransactionEchartTitle(List<String> rechargeTransactionEchartTitle) {
        this.rechargeTransactionEchartTitle = rechargeTransactionEchartTitle;
    }

    public List<Float> getTotalRechargeTransactionEchartSeriesData() {
        return totalRechargeTransactionEchartSeriesData;
    }

    public void setTotalRechargeTransactionEchartSeriesData(List<Float> totalRechargeTransactionEchartSeriesData) {
        this.totalRechargeTransactionEchartSeriesData = totalRechargeTransactionEchartSeriesData;
    }

    public List<Float> getFromRechargeTransactionEchartSeriesData() {
        return fromRechargeTransactionEchartSeriesData;
    }

    public void setFromRechargeTransactionEchartSeriesData(List<Float> fromRechargeTransactionEchartSeriesData) {
        this.fromRechargeTransactionEchartSeriesData = fromRechargeTransactionEchartSeriesData;
    }

    public List<Float> getToRechargeTransactionEchartSeriesData() {
        return toRechargeTransactionEchartSeriesData;
    }

    public void setToRechargeTransactionEchartSeriesData(List<Float> toRechargeTransactionEchartSeriesData) {
        this.toRechargeTransactionEchartSeriesData = toRechargeTransactionEchartSeriesData;
    }
}
