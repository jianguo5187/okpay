package com.ruoyi.common.core.vo.req;

public class UpdateUserInfoReqVO {

    /** 用户昵称 */
    private String nickName;

    /** 用户头像 */
    private String avatar;

    /** 个性签名 */
    private String remark;

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
