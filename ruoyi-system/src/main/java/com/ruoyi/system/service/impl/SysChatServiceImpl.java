package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysChat;
import com.ruoyi.common.core.vo.req.ChatHistoryReqVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysChatMapper;
import com.ruoyi.system.service.ISysChatService;
import com.ruoyi.common.core.text.Convert;

/**
 * 聊天信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-12-28
 */
@Service
public class SysChatServiceImpl implements ISysChatService 
{
    @Autowired
    private SysChatMapper sysChatMapper;

    /**
     * 查询聊天信息
     * 
     * @param chatId 聊天信息主键
     * @return 聊天信息
     */
    @Override
    public SysChat selectSysChatByChatId(Long chatId)
    {
        return sysChatMapper.selectSysChatByChatId(chatId);
    }

    /**
     * 查询聊天信息列表
     * 
     * @param sysChat 聊天信息
     * @return 聊天信息
     */
    @Override
    public List<SysChat> selectSysChatList(SysChat sysChat)
    {
        return sysChatMapper.selectSysChatList(sysChat);
    }

    /**
     * 新增聊天信息
     * 
     * @param sysChat 聊天信息
     * @return 结果
     */
    @Override
    public int insertSysChat(SysChat sysChat)
    {
        return sysChatMapper.insertSysChat(sysChat);
    }

    /**
     * 修改聊天信息
     * 
     * @param sysChat 聊天信息
     * @return 结果
     */
    @Override
    public int updateSysChat(SysChat sysChat)
    {
        return sysChatMapper.updateSysChat(sysChat);
    }

    /**
     * 批量删除聊天信息
     * 
     * @param chatIds 需要删除的聊天信息主键
     * @return 结果
     */
    @Override
    public int deleteSysChatByChatIds(String chatIds)
    {
        return sysChatMapper.deleteSysChatByChatIds(Convert.toStrArray(chatIds));
    }

    /**
     * 删除聊天信息信息
     * 
     * @param chatId 聊天信息主键
     * @return 结果
     */
    @Override
    public int deleteSysChatByChatId(Long chatId)
    {
        return sysChatMapper.deleteSysChatByChatId(chatId);
    }

    /**
     * 查询聊天历史信息列表
     *
     * @param vo 聊天信息
     * @return 聊天信息集合
     */
    public List<SysChat> historyList(ChatHistoryReqVO vo){
        return sysChatMapper.historyList(vo.getChatFromUser(),vo.getChatToUser(),(vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());
    }
}
