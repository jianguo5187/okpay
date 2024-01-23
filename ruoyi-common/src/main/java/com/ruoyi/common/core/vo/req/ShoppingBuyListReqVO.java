package com.ruoyi.common.core.vo.req;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ShoppingBuyListReqVO {

    /** 买币开始日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startBuyTime;

    /** 买币结束日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endBuyTime;

    /** 买币用户ID */
    private Long buyUserId;

    /** 卖币No */
    private String saleNo;

    /** 支付方式 */
    private String buyType;

    /** 买币状态（0进行中 1买家已付款 2卖家已确认(买币完成) 9已取消） */
    private String status;

    public Date getStartBuyTime() {
        return startBuyTime;
    }

    public void setStartBuyTime(Date startBuyTime) {
        this.startBuyTime = startBuyTime;
    }

    public Date getEndBuyTime() {
        return endBuyTime;
    }

    public void setEndBuyTime(Date endBuyTime) {
        this.endBuyTime = endBuyTime;
    }

    public Long getBuyUserId() {
        return buyUserId;
    }

    public void setBuyUserId(Long buyUserId) {
        this.buyUserId = buyUserId;
    }

    public String getSaleNo() {
        return saleNo;
    }

    public void setSaleNo(String saleNo) {
        this.saleNo = saleNo;
    }

    public String getBuyType() {
        return buyType;
    }

    public void setBuyType(String buyType) {
        this.buyType = buyType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
