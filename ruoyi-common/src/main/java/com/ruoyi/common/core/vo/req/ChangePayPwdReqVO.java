package com.ruoyi.common.core.vo.req;

public class ChangePayPwdReqVO {

    /** 旧支付密码 */
    private String oldPayPassword;

    /** 新支付密码 */
    private String newPayPassword;

    private String phonenumber;

    public String getOldPayPassword() {
        return oldPayPassword;
    }

    public void setOldPayPassword(String oldPayPassword) {
        this.oldPayPassword = oldPayPassword;
    }

    public String getNewPayPassword() {
        return newPayPassword;
    }

    public void setNewPayPassword(String newPayPassword) {
        this.newPayPassword = newPayPassword;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }
}
