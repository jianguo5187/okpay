package com.ruoyi.common.core.domain.entity;

import java.util.Date;
import java.util.List;
import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.annotation.Excel.Type;
import com.ruoyi.common.annotation.Excels;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.xss.Xss;

/**
 * 用户对象 sys_user
 * 
 * @author ruoyi
 */
public class SysUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    @Excel(name = "用户序号", cellType = ColumnType.NUMERIC, prompt = "用户编号")
    private Long userId;

    /** 部门ID */
    @Excel(name = "部门编号", type = Type.IMPORT)
    private Long deptId;

    /** 用户账号 */
    @Excel(name = "登录名称")
    private String userName;

    /** 用户昵称 */
    @Excel(name = "用户名称")
    private String nickName;

    /** 用户邮箱 */
    @Excel(name = "用户邮箱")
    private String email;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String phonenumber;

    /** 用户性别 */
    @Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
    private String sex;

    /** 用户头像 */
    private String avatar;

    /** 密码 */
    private String password;

    /** 支付密码 */
    private String payPassword;

    /** 真实姓名 */
    private String realName;

    /** 身份证号码 */
    private String idcardNo;

    /** 身份证正面图片路径 */
    private String idcardFrontImg;

    /** 身份证反面图片路径 */
    private String idcardBackImg;

    /** 人脸图片路径 */
    private String faceImg;

    /** 钱包地址 */
    private String walletAddress;

    /** 余额 */
    private Float amount;

    /** 邀请码 */
    private String inviteCode;

    /** 微信收款填充信息 */
    private String wechatPayRemark;

    /** 微信收款码图片地址 */
    private String wechatPayImg;

    /** 支付宝收款填充信息 */
    private String alipayRemark;

    /** 支付宝收款码图片地址 */
    private String alipayImg;

    /** 银联填充信息 */
    private String unionpayRemark;

    /** 银联收款户名 */
    private String unionpayAccount;

    /** 银联收款卡号 */
    private String unionpayCard;

    /** 用户类型（00系统用户,01平台管理员,02商户,03代理,04客户） */
    private String userType;

    /** 上级用户ID */
    private Long parentUserId;

    /** 加急手续费 */
    private Integer ungentCommission;

    /** 普通手续费 */
    private Integer normalCommission;

    /** 是否可以创建代理（0可以 1不行） */
    private String createAgentFlg;

    /** 帐号状态（0正常 1停用） */
    @Excel(name = "帐号状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 最后登录IP */
    @Excel(name = "最后登录IP", type = Type.EXPORT)
    private String loginIp;

    /** 最后登录时间 */
    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss", type = Type.EXPORT)
    private Date loginDate;

    /** 部门对象 */
    @Excels({
        @Excel(name = "部门名称", targetAttr = "deptName", type = Type.EXPORT),
        @Excel(name = "部门负责人", targetAttr = "leader", type = Type.EXPORT)
    })
    private SysDept dept;

    /** 角色对象 */
    private List<SysRole> roles;

    /** 角色组 */
    private Long[] roleIds;

    /** 岗位组 */
    private Long[] postIds;

    /** 角色ID */
    private Long roleId;

    /** 信息接收方用户ID */
    private Long toUserId;

    /** 未读消息件数 */
    private Integer noReadMsgCount;

    /** 上级商户ID */
    private Long merchantUserId;

    public SysUser()
    {

    }

    public SysUser(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public boolean isAdmin()
    {
        return isAdmin(this.userId);
    }

    public static boolean isAdmin(Long userId)
    {
        return userId != null && 1L == userId;
    }

    public Long getDeptId()
    {
        return deptId;
    }

    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }

    @Xss(message = "用户昵称不能包含脚本字符")
    @Size(min = 0, max = 30, message = "用户昵称长度不能超过30个字符")
    public String getNickName()
    {
        return nickName;
    }

    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }

    @Xss(message = "用户账号不能包含脚本字符")
    @NotBlank(message = "用户账号不能为空")
    @Size(min = 0, max = 30, message = "用户账号长度不能超过30个字符")
    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    @Email(message = "邮箱格式不正确")
    @Size(min = 0, max = 50, message = "邮箱长度不能超过50个字符")
    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    @Size(min = 0, max = 11, message = "手机号码长度不能超过11个字符")
    public String getPhonenumber()
    {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber)
    {
        this.phonenumber = phonenumber;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getAvatar()
    {
        return avatar;
    }

    public void setAvatar(String avatar)
    {
        this.avatar = avatar;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getPayPassword() {
        return payPassword;
    }

    public void setPayPassword(String payPassword) {
        this.payPassword = payPassword;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getIdcardNo() {
        return idcardNo;
    }

    public void setIdcardNo(String idcardNo) {
        this.idcardNo = idcardNo;
    }

    public String getIdcardFrontImg() {
        return idcardFrontImg;
    }

    public void setIdcardFrontImg(String idcardFrontImg) {
        this.idcardFrontImg = idcardFrontImg;
    }

    public String getIdcardBackImg() {
        return idcardBackImg;
    }

    public void setIdcardBackImg(String idcardBackImg) {
        this.idcardBackImg = idcardBackImg;
    }

    public String getFaceImg() {
        return faceImg;
    }

    public void setFaceImg(String faceImg) {
        this.faceImg = faceImg;
    }

    public String getWalletAddress() {
        return walletAddress;
    }

    public void setWalletAddress(String walletAddress) {
        this.walletAddress = walletAddress;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public String getInviteCode() {
        return inviteCode;
    }

    public void setInviteCode(String inviteCode) {
        this.inviteCode = inviteCode;
    }

    public String getWechatPayImg() {
        return wechatPayImg;
    }

    public void setWechatPayImg(String wechatPayImg) {
        this.wechatPayImg = wechatPayImg;
    }

    public String getAlipayImg() {
        return alipayImg;
    }

    public void setAlipayImg(String alipayImg) {
        this.alipayImg = alipayImg;
    }

    public String getWechatPayRemark() {
        return wechatPayRemark;
    }

    public void setWechatPayRemark(String wechatPayRemark) {
        this.wechatPayRemark = wechatPayRemark;
    }

    public String getAlipayRemark() {
        return alipayRemark;
    }

    public void setAlipayRemark(String alipayRemark) {
        this.alipayRemark = alipayRemark;
    }

    public String getUnionpayRemark() {
        return unionpayRemark;
    }

    public void setUnionpayRemark(String unionpayRemark) {
        this.unionpayRemark = unionpayRemark;
    }

    public String getUnionpayAccount() {
        return unionpayAccount;
    }

    public void setUnionpayAccount(String unionpayAccount) {
        this.unionpayAccount = unionpayAccount;
    }

    public String getUnionpayCard() {
        return unionpayCard;
    }

    public void setUnionpayCard(String unionpayCard) {
        this.unionpayCard = unionpayCard;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public Long getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(Long parentUserId) {
        this.parentUserId = parentUserId;
    }

    public Integer getUngentCommission() {
        return ungentCommission;
    }

    public void setUngentCommission(Integer ungentCommission) {
        this.ungentCommission = ungentCommission;
    }

    public Integer getNormalCommission() {
        return normalCommission;
    }

    public void setNormalCommission(Integer normalCommission) {
        this.normalCommission = normalCommission;
    }

    public String getCreateAgentFlg() {
        return createAgentFlg;
    }

    public void setCreateAgentFlg(String createAgentFlg) {
        this.createAgentFlg = createAgentFlg;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getLoginIp()
    {
        return loginIp;
    }

    public void setLoginIp(String loginIp)
    {
        this.loginIp = loginIp;
    }

    public Date getLoginDate()
    {
        return loginDate;
    }

    public void setLoginDate(Date loginDate)
    {
        this.loginDate = loginDate;
    }

    public SysDept getDept()
    {
        return dept;
    }

    public void setDept(SysDept dept)
    {
        this.dept = dept;
    }

    public List<SysRole> getRoles()
    {
        return roles;
    }

    public void setRoles(List<SysRole> roles)
    {
        this.roles = roles;
    }

    public Long[] getRoleIds()
    {
        return roleIds;
    }

    public void setRoleIds(Long[] roleIds)
    {
        this.roleIds = roleIds;
    }

    public Long[] getPostIds()
    {
        return postIds;
    }

    public void setPostIds(Long[] postIds)
    {
        this.postIds = postIds;
    }

    public Long getRoleId()
    {
        return roleId;
    }

    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Integer getNoReadMsgCount() {
        return noReadMsgCount;
    }

    public void setNoReadMsgCount(Integer noReadMsgCount) {
        this.noReadMsgCount = noReadMsgCount;
    }

    public Long getToUserId() {
        return toUserId;
    }

    public void setToUserId(Long toUserId) {
        this.toUserId = toUserId;
    }

    public Long getMerchantUserId() {
        return merchantUserId;
    }

    public void setMerchantUserId(Long merchantUserId) {
        this.merchantUserId = merchantUserId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("deptId", getDeptId())
            .append("userName", getUserName())
            .append("nickName", getNickName())
            .append("email", getEmail())
            .append("phonenumber", getPhonenumber())
            .append("sex", getSex())
            .append("avatar", getAvatar())
            .append("password", getPassword())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("loginIp", getLoginIp())
            .append("loginDate", getLoginDate())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("dept", getDept())
            .toString();
    }
}
