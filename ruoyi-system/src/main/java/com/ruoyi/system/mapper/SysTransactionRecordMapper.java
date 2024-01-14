package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SysTransactionRecord;

/**
 * 交易记录Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
public interface SysTransactionRecordMapper 
{
    /**
     * 查询交易记录
     * 
     * @param recordId 交易记录主键
     * @return 交易记录
     */
    public SysTransactionRecord selectSysTransactionRecordByRecordId(Long recordId);

    /**
     * 查询交易记录列表
     * 
     * @param sysTransactionRecord 交易记录
     * @return 交易记录集合
     */
    public List<SysTransactionRecord> selectSysTransactionRecordList(SysTransactionRecord sysTransactionRecord);

    /**
     * 新增交易记录
     * 
     * @param sysTransactionRecord 交易记录
     * @return 结果
     */
    public int insertSysTransactionRecord(SysTransactionRecord sysTransactionRecord);

    /**
     * 修改交易记录
     * 
     * @param sysTransactionRecord 交易记录
     * @return 结果
     */
    public int updateSysTransactionRecord(SysTransactionRecord sysTransactionRecord);

    /**
     * 删除交易记录
     * 
     * @param recordId 交易记录主键
     * @return 结果
     */
    public int deleteSysTransactionRecordByRecordId(Long recordId);

    /**
     * 批量删除交易记录
     * 
     * @param recordIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysTransactionRecordByRecordIds(Long[] recordIds);
}
