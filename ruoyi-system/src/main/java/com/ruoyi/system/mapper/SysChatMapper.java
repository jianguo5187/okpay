package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.SysChat;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 聊天信息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-12-28
 */
public interface SysChatMapper 
{
    /**
     * 查询聊天信息
     * 
     * @param chatId 聊天信息主键
     * @return 聊天信息
     */
    public SysChat selectSysChatByChatId(Long chatId);

    /**
     * 查询聊天信息列表
     * 
     * @param sysChat 聊天信息
     * @return 聊天信息集合
     */
    public List<SysChat> selectSysChatList(SysChat sysChat);

    /**
     * 新增聊天信息
     * 
     * @param sysChat 聊天信息
     * @return 结果
     */
    public int insertSysChat(SysChat sysChat);

    /**
     * 修改聊天信息
     * 
     * @param sysChat 聊天信息
     * @return 结果
     */
    public int updateSysChat(SysChat sysChat);

    /**
     * 删除聊天信息
     * 
     * @param chatId 聊天信息主键
     * @return 结果
     */
    public int deleteSysChatByChatId(Long chatId);

    /**
     * 批量删除聊天信息
     * 
     * @param chatIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysChatByChatIds(String[] chatIds);

    /**
     * 查询聊天历史信息列表
     *
     * @return 聊天信息集合
     */
    public List<SysChat> historyList(@Param("chatFromUser")Long chatFromUser, @Param("chatToUser")Long chatToUser, @Param("pageNumber")Integer pageNumber, @Param("pageRowCount")Integer pageRowCount);
}
