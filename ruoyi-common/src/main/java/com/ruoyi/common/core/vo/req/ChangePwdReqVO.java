package com.ruoyi.common.core.vo.req;

public class ChangePwdReqVO {

    /** 旧密码 */
    private String oldPassword;

    /** 新密码 */
    private String newPassword;

    private String phonenumber;

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }
}
