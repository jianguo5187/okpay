package com.ruoyi.common.core.vo.req;

import javax.validation.constraints.NotNull;

public class GetMySaleListReqVO {
    private String status;
    @NotNull(message = "页数不能为空")
    private Integer pageNumber;

    @NotNull(message = "每页显示件数不能为空")
    private Integer pageRowCount;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


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
}
