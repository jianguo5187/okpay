package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysTransactionRecordMapper;
import com.ruoyi.common.core.domain.entity.SysTransactionRecord;
import com.ruoyi.system.service.ISysTransactionRecordService;

/**
 * 交易记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
@Service
public class SysTransactionRecordServiceImpl implements ISysTransactionRecordService 
{
    @Autowired
    private SysTransactionRecordMapper sysTransactionRecordMapper;

    /**
     * 查询交易记录
     * 
     * @param recordId 交易记录主键
     * @return 交易记录
     */
    @Override
    public SysTransactionRecord selectSysTransactionRecordByRecordId(Long recordId)
    {
        return sysTransactionRecordMapper.selectSysTransactionRecordByRecordId(recordId);
    }

    /**
     * 查询交易记录列表
     * 
     * @param sysTransactionRecord 交易记录
     * @return 交易记录
     */
    @Override
    public List<SysTransactionRecord> selectSysTransactionRecordList(SysTransactionRecord sysTransactionRecord)
    {
        return sysTransactionRecordMapper.selectSysTransactionRecordList(sysTransactionRecord);
    }

    /**
     * 新增交易记录
     * 
     * @param sysTransactionRecord 交易记录
     * @return 结果
     */
    @Override
    public int insertSysTransactionRecord(SysTransactionRecord sysTransactionRecord)
    {
        sysTransactionRecord.setCreateTime(DateUtils.getNowDate());
        return sysTransactionRecordMapper.insertSysTransactionRecord(sysTransactionRecord);
    }

    /**
     * 修改交易记录
     * 
     * @param sysTransactionRecord 交易记录
     * @return 结果
     */
    @Override
    public int updateSysTransactionRecord(SysTransactionRecord sysTransactionRecord)
    {
        return sysTransactionRecordMapper.updateSysTransactionRecord(sysTransactionRecord);
    }

    /**
     * 批量删除交易记录
     * 
     * @param recordIds 需要删除的交易记录主键
     * @return 结果
     */
    @Override
    public int deleteSysTransactionRecordByRecordIds(Long[] recordIds)
    {
        return sysTransactionRecordMapper.deleteSysTransactionRecordByRecordIds(recordIds);
    }

    /**
     * 删除交易记录信息
     * 
     * @param recordId 交易记录主键
     * @return 结果
     */
    @Override
    public int deleteSysTransactionRecordByRecordId(Long recordId)
    {
        return sysTransactionRecordMapper.deleteSysTransactionRecordByRecordId(recordId);
    }
}
