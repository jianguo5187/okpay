package com.ruoyi.common.core.vo.req;

import javax.validation.constraints.NotNull;

public class CheckPayPwdReqVO {

    /** 支付密码 */
    @NotNull(message = "支付密码不能为空")
    private String payPassword;

    public String getPayPassword() {
        return payPassword;
    }

    public void setPayPassword(String payPassword) {
        this.payPassword = payPassword;
    }
}
