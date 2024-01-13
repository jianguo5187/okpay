package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SysRecharge;

/**
 * 充值Service接口
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
public interface ISysRechargeService 
{
    /**
     * 查询充值
     * 
     * @param rechargeId 充值主键
     * @return 充值
     */
    public SysRecharge selectSysRechargeByRechargeId(Long rechargeId);

    /**
     * 查询充值列表
     * 
     * @param sysRecharge 充值
     * @return 充值集合
     */
    public List<SysRecharge> selectSysRechargeList(SysRecharge sysRecharge);

    /**
     * 新增充值
     * 
     * @param sysRecharge 充值
     * @return 结果
     */
    public int insertSysRecharge(SysRecharge sysRecharge);

    /**
     * 修改充值
     * 
     * @param sysRecharge 充值
     * @return 结果
     */
    public int updateSysRecharge(SysRecharge sysRecharge);

    /**
     * 批量删除充值
     * 
     * @param rechargeIds 需要删除的充值主键集合
     * @return 结果
     */
    public int deleteSysRechargeByRechargeIds(Long[] rechargeIds);

    /**
     * 删除充值信息
     * 
     * @param rechargeId 充值主键
     * @return 结果
     */
    public int deleteSysRechargeByRechargeId(Long rechargeId);
}
