package com.ruoyi.common.core.vo.req;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class GetMyTransactionListReqVO {

    /** 页数 */
    private Integer pageNumber;

    /** 每页件数 */
    private Integer pageRowCount;

    /** 交易类型（0买币 1卖币 2商家直充 3代理充值 4充值到商户(提现) 5手续费） */
    private String recordType;

    /** 交易时间From(yyyy-mm-dd) */
    private String recordTimeFrom;

    /** 交易时间To(yyyy-mm-dd) */
    private String recordTimeTo;

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getPageRowCount() {
        return pageRowCount;
    }

    public void setPageRowCount(Integer pageRowCount) {
        this.pageRowCount = pageRowCount;
    }

    public String getRecordType() {
        return recordType;
    }

    public void setRecordType(String recordType) {
        this.recordType = recordType;
    }

    public String getRecordTimeFrom() {
        return recordTimeFrom;
    }

    public void setRecordTimeFrom(String recordTimeFrom) {
        this.recordTimeFrom = recordTimeFrom;
    }

    public String getRecordTimeTo() {
        return recordTimeTo;
    }

    public void setRecordTimeTo(String recordTimeTo) {
        this.recordTimeTo = recordTimeTo;
    }
}
