package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysUserPayTypeApproveMapper;
import com.ruoyi.common.core.domain.entity.SysUserPayTypeApprove;
import com.ruoyi.system.service.ISysUserPayTypeApproveService;

/**
 * 用户支付方式审核Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-02-29
 */
@Service
public class SysUserPayTypeApproveServiceImpl implements ISysUserPayTypeApproveService 
{
    @Autowired
    private SysUserPayTypeApproveMapper sysUserPayTypeApproveMapper;

    /**
     * 查询用户支付方式审核
     * 
     * @param payTypeApproveId 用户支付方式审核主键
     * @return 用户支付方式审核
     */
    @Override
    public SysUserPayTypeApprove selectSysUserPayTypeApproveByPayTypeApproveId(Long payTypeApproveId)
    {
        return sysUserPayTypeApproveMapper.selectSysUserPayTypeApproveByPayTypeApproveId(payTypeApproveId);
    }

    /**
     * 查询用户支付方式审核列表
     * 
     * @param sysUserPayTypeApprove 用户支付方式审核
     * @return 用户支付方式审核
     */
    @Override
    public List<SysUserPayTypeApprove> selectSysUserPayTypeApproveList(SysUserPayTypeApprove sysUserPayTypeApprove)
    {
        return sysUserPayTypeApproveMapper.selectSysUserPayTypeApproveList(sysUserPayTypeApprove);
    }

    /**
     * 新增用户支付方式审核
     * 
     * @param sysUserPayTypeApprove 用户支付方式审核
     * @return 结果
     */
    @Override
    public int insertSysUserPayTypeApprove(SysUserPayTypeApprove sysUserPayTypeApprove)
    {
        sysUserPayTypeApprove.setCreateTime(DateUtils.getNowDate());
        return sysUserPayTypeApproveMapper.insertSysUserPayTypeApprove(sysUserPayTypeApprove);
    }

    /**
     * 修改用户支付方式审核
     * 
     * @param sysUserPayTypeApprove 用户支付方式审核
     * @return 结果
     */
    @Override
    public int updateSysUserPayTypeApprove(SysUserPayTypeApprove sysUserPayTypeApprove)
    {
        sysUserPayTypeApprove.setUpdateTime(DateUtils.getNowDate());
        return sysUserPayTypeApproveMapper.updateSysUserPayTypeApprove(sysUserPayTypeApprove);
    }

    /**
     * 批量删除用户支付方式审核
     * 
     * @param payTypeApproveIds 需要删除的用户支付方式审核主键
     * @return 结果
     */
    @Override
    public int deleteSysUserPayTypeApproveByPayTypeApproveIds(Long[] payTypeApproveIds)
    {
        return sysUserPayTypeApproveMapper.deleteSysUserPayTypeApproveByPayTypeApproveIds(payTypeApproveIds);
    }

    /**
     * 删除用户支付方式审核信息
     * 
     * @param payTypeApproveId 用户支付方式审核主键
     * @return 结果
     */
    @Override
    public int deleteSysUserPayTypeApproveByPayTypeApproveId(Long payTypeApproveId)
    {
        return sysUserPayTypeApproveMapper.deleteSysUserPayTypeApproveByPayTypeApproveId(payTypeApproveId);
    }

    @Override
    public boolean checkExistsApproveInfo(SysUserPayTypeApprove sysUserPayTypeApprove) {
        SysUserPayTypeApprove info = sysUserPayTypeApproveMapper.checkExistsApproveInfo(sysUserPayTypeApprove);
        if (StringUtils.isNotNull(info))
        {
            return true;
        }
        return false;
    }
}
