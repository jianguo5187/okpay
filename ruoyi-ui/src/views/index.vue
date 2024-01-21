<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>本月收入</span>
          </div>
          <div class="body">
            <p>
              <i class="el-icon-s-promotion"></i> 官网：<el-link
              href="http://www.ruoyi.vip"
              target="_blank"
            >http://www.ruoyi.vip</el-link
            >
            </p>
            <p>
              <i class="el-icon-user-solid"></i> QQ群：<s> 满937441 </s> <s> 满887144332 </s>
              <s> 满180251782 </s> <s> 满104180207 </s> <s> 满186866453 </s> <s> 满201396349 </s>
              <s> 满101456076 </s> <s> 满101539465 </s> <s> 满264312783 </s> <s> 满167385320 </s>
              <s> 满104748341 </s> <s> 满160110482 </s> <s> 满170801498 </s> <s> 满108482800 </s>
              <s> 满101046199 </s> <s> 满136919097 </s> <s> 满143961921 </s> <s> 满174951577 </s> <a href="http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=Lj0nHRAPD5CZv1jTOciuxXVloBJLS2Lp&authKey=Q2RxC6%2Ffxney9yOGBY0sDJxFhX9b7o1FRY1bsESmkbcZ4PFt6Vx92FpVo9O1u9p4&noverify=0&group_code=161281055" target="_blank">161281055</a>
            </p>
            <p>
              <i class="el-icon-chat-dot-round"></i> 微信：<a
              href="javascript:;"
            >/ *OKPAY</a
            >
            </p>
            <p>
              <i class="el-icon-money"></i> 支付宝：<a
              href="javascript:;"
              class="支付宝信息"
            >/ *OKPAY</a
            >
            </p>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.8.7"
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    }
  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

