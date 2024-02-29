package com.ruoyi.framework.config;

import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.system.service.ISysAppService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.listener.KeyExpirationEventMessageListener;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;

@Component
public class RedisKeyExpirationListener extends KeyExpirationEventMessageListener {

    private static ISysAppService sysAppService;

    @Autowired
    public void setAppService(ISysAppService sysAppService) {
        RedisKeyExpirationListener.sysAppService = sysAppService;
    }
    private static final Logger log = LoggerFactory.getLogger(RedisKeyExpirationListener.class);

    public RedisKeyExpirationListener(RedisMessageListenerContainer listenerContainer) {
        super(listenerContainer);
    }

    /**
     * 监听到过期消息
     *
     * @param message key
     * @param pattern 消息事件
     * @return void
     * @author lei
     * @date 2022-09-27 10:17:54
     */
    @Override
    public void onMessage(Message message, byte[] pattern) {
        String expiredKey = message.toString();

//        SysUser user = sysUserService.selectUserById(11l);
        // 过期消息key:aaa.......pattern:__keyevent@*__:expired
        log.info("过期消息key:{}.......pattern:{}", expiredKey, new String(pattern, StandardCharsets.UTF_8));
        // 未付款订单超时
        if(expiredKey.indexOf(CacheConstants.BUY_ICON_ORDER_ID_NO_PAY) >= 0){

            String buyId = expiredKey.replace(CacheConstants.BUY_ICON_ORDER_ID_NO_PAY,"");
            sysAppService.buyCoinAutoCancel(Long.parseLong(buyId));
        // 付款完卖家未确认超时
        }else if(expiredKey.indexOf(CacheConstants.BUY_ICON_ORDER_ID_AUTO_FINISH) >= 0){

            String buyId = expiredKey.replace(CacheConstants.BUY_ICON_ORDER_ID_AUTO_FINISH,"");
            sysAppService.buyCoinAutoFinish(Long.parseLong(buyId));
        }
    }
}

