package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysRechargeMapper;
import com.ruoyi.common.core.domain.entity.SysRecharge;
import com.ruoyi.system.service.ISysRechargeService;

/**
 * 充值Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
@Service
public class SysRechargeServiceImpl implements ISysRechargeService 
{
    @Autowired
    private SysRechargeMapper sysRechargeMapper;

    /**
     * 查询充值
     * 
     * @param rechargeId 充值主键
     * @return 充值
     */
    @Override
    public SysRecharge selectSysRechargeByRechargeId(Long rechargeId)
    {
        return sysRechargeMapper.selectSysRechargeByRechargeId(rechargeId);
    }

    /**
     * 查询充值列表
     * 
     * @param sysRecharge 充值
     * @return 充值
     */
    @Override
    public List<SysRecharge> selectSysRechargeList(SysRecharge sysRecharge)
    {
        return sysRechargeMapper.selectSysRechargeList(sysRecharge);
    }

    /**
     * 新增充值
     * 
     * @param sysRecharge 充值
     * @return 结果
     */
    @Override
    public int insertSysRecharge(SysRecharge sysRecharge)
    {
        sysRecharge.setCreateTime(DateUtils.getNowDate());
        return sysRechargeMapper.insertSysRecharge(sysRecharge);
    }

    /**
     * 修改充值
     * 
     * @param sysRecharge 充值
     * @return 结果
     */
    @Override
    public int updateSysRecharge(SysRecharge sysRecharge)
    {
        return sysRechargeMapper.updateSysRecharge(sysRecharge);
    }

    /**
     * 批量删除充值
     * 
     * @param rechargeIds 需要删除的充值主键
     * @return 结果
     */
    @Override
    public int deleteSysRechargeByRechargeIds(Long[] rechargeIds)
    {
        return sysRechargeMapper.deleteSysRechargeByRechargeIds(rechargeIds);
    }

    /**
     * 删除充值信息
     * 
     * @param rechargeId 充值主键
     * @return 结果
     */
    @Override
    public int deleteSysRechargeByRechargeId(Long rechargeId)
    {
        return sysRechargeMapper.deleteSysRechargeByRechargeId(rechargeId);
    }
}
