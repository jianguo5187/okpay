package com.ruoyi.system.mapper;


import com.ruoyi.common.core.domain.entity.SysTransactionRecord;

import java.util.List;

import com.ruoyi.common.core.vo.resp.TransactionDetailInfoRespVO;
import com.ruoyi.common.core.vo.resp.UserTransactionDetailInfoRespVO;
import com.ruoyi.common.core.vo.resp.UserTransactionTotalRespVO;
import org.apache.ibatis.annotations.Param;

/**
 * 交易记录Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-19
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
    

    /**
     * 查询交易记录
     * 
     * @return 交易记录
     */
    public SysTransactionRecord selectTransactionRecordByRecordTypeAndId(@Param("recordType") String recordType,@Param("buyId") Long buyId,@Param("saleId") Long saleId,@Param("rechargeId") Long rechargeId);

    public List<TransactionDetailInfoRespVO> getMyTransactionList(@Param("userId") Long userId, @Param("recordType")String[] recordType,@Param("recordTimeFrom")String recordTimeFrom,@Param("recordTimeTo")String recordTimeTo,@Param("pageNumber") Integer pageNumber, @Param("pageRowCount") Integer pageRowCount);

    public List<UserTransactionTotalRespVO> selectUserTransactionlist(SysTransactionRecord sysTransactionRecord);

    public Float getTransactonAmountTotal(@Param("userId")Long userId, @Param("deptId")Long deptId, @Param("todayFlg")String todayFlg, @Param("yesterdayFlg")String yesterdayFlg);

    public List<UserTransactionDetailInfoRespVO> selectUserTransactionMoneyList(SysTransactionRecord sysTransactionRecord);

    public List<UserTransactionDetailInfoRespVO> selectWeekBuySaleTransactionMoneyList(SysTransactionRecord sysTransactionRecord);

    public List<UserTransactionDetailInfoRespVO> selectRechargeTransactionMoneyList(SysTransactionRecord sysTransactionRecord);

    public List<UserTransactionDetailInfoRespVO> selectWeekRechargeTransactionMoneyList(SysTransactionRecord sysTransactionRecord);
}
