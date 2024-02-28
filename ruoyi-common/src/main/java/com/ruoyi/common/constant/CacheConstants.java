package com.ruoyi.common.constant;

/**
 * 缓存的key 常量
 * 
 * @author ruoyi
 */
public class CacheConstants
{
    /**
     * 登录用户 redis key
     */
    public static final String LOGIN_TOKEN_KEY = "login_tokens:";

    /**
     * 验证码 redis key
     */
    public static final String CAPTCHA_CODE_KEY = "captcha_codes:";

    /**
     * 参数管理 cache key
     */
    public static final String SYS_CONFIG_KEY = "sys_config:";

    /**
     * 字典管理 cache key
     */
    public static final String SYS_DICT_KEY = "sys_dict:";

    /**
     * 防重提交 redis key
     */
    public static final String REPEAT_SUBMIT_KEY = "repeat_submit:";

    /**
     * 限流 redis key
     */
    public static final String RATE_LIMIT_KEY = "rate_limit:";

    /**
     * 登录账户密码错误次数 redis key
     */
    public static final String PWD_ERR_CNT_KEY = "pwd_err_cnt:";
    /**
     * 登录用户id redis key 用于实现灵活控制多设备登录
     */
    public static final String LOGIN_USER_ID_KEY = "login_user_ids:";

    /**
     * 卖币订单id redis key
     */
    public static final String SALE_ICON_ORDER_ID = "sale_icon_id:";

    /**
     * 未付款订单id redis key
     */
    public static final String BUY_ICON_ORDER_ID_NO_PAY = "buy_icon_id_no_pay:";

    /**
     * 付款完自动确认订单id redis key
     */
    public static final String BUY_ICON_ORDER_ID_AUTO_FINISH = "buy_icon_id_auto_finish:";
}
