package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SysUserPayTypeApprove;

/**
 * 用户支付方式审核Service接口
 * 
 * @author ruoyi
 * @date 2024-02-29
 */
public interface ISysUserPayTypeApproveService 
{
    /**
     * 查询用户支付方式审核
     * 
     * @param payTypeApproveId 用户支付方式审核主键
     * @return 用户支付方式审核
     */
    public SysUserPayTypeApprove selectSysUserPayTypeApproveByPayTypeApproveId(Long payTypeApproveId);

    /**
     * 查询用户支付方式审核列表
     * 
     * @param sysUserPayTypeApprove 用户支付方式审核
     * @return 用户支付方式审核集合
     */
    public List<SysUserPayTypeApprove> selectSysUserPayTypeApproveList(SysUserPayTypeApprove sysUserPayTypeApprove);

    /**
     * 新增用户支付方式审核
     * 
     * @param sysUserPayTypeApprove 用户支付方式审核
     * @return 结果
     */
    public int insertSysUserPayTypeApprove(SysUserPayTypeApprove sysUserPayTypeApprove);

    /**
     * 修改用户支付方式审核
     * 
     * @param sysUserPayTypeApprove 用户支付方式审核
     * @return 结果
     */
    public int updateSysUserPayTypeApprove(SysUserPayTypeApprove sysUserPayTypeApprove);

    /**
     * 批量删除用户支付方式审核
     * 
     * @param payTypeApproveIds 需要删除的用户支付方式审核主键集合
     * @return 结果
     */
    public int deleteSysUserPayTypeApproveByPayTypeApproveIds(Long[] payTypeApproveIds);

    /**
     * 删除用户支付方式审核信息
     * 
     * @param payTypeApproveId 用户支付方式审核主键
     * @return 结果
     */
    public int deleteSysUserPayTypeApproveByPayTypeApproveId(Long payTypeApproveId);
}
