package com.ruoyi.common.core.vo.req;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ShoppingListReqVO {

    /** 挂单开始日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startSaleTime;

    /** 挂单结束日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endSaleTime;

    /** 卖币用户ID */
    private Long saleUserId;

    /** 卖币No */
    private String saleNo;

    /** 卖币拆分类型（0不拆分 1拆分） */
    private String saleSplitType;

    /** 支持支付类型 */
    private String supportBuyType;

    /** 加急状态（0否 1是） */
    private String urgentSaleFlg;

    /** 卖币状态（0生成订单 1交易中 2已完成 9已取消） */
    private String status;

    public String getSaleNo() {
        return saleNo;
    }

    public void setSaleNo(String saleNo) {
        this.saleNo = saleNo;
    }

    public String getSaleSplitType() {
        return saleSplitType;
    }

    public void setSaleSplitType(String saleSplitType) {
        this.saleSplitType = saleSplitType;
    }

    public String getSupportBuyType() {
        return supportBuyType;
    }

    public void setSupportBuyType(String supportBuyType) {
        this.supportBuyType = supportBuyType;
    }

    public String getUrgentSaleFlg() {
        return urgentSaleFlg;
    }

    public void setUrgentSaleFlg(String urgentSaleFlg) {
        this.urgentSaleFlg = urgentSaleFlg;
    }

    public Date getStartSaleTime() {
        return startSaleTime;
    }

    public void setStartSaleTime(Date startSaleTime) {
        this.startSaleTime = startSaleTime;
    }

    public Date getEndSaleTime() {
        return endSaleTime;
    }

    public void setEndSaleTime(Date endSaleTime) {
        this.endSaleTime = endSaleTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getSaleUserId() {
        return saleUserId;
    }

    public void setSaleUserId(Long saleUserId) {
        this.saleUserId = saleUserId;
    }
}
