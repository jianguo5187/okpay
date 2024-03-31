<template>
  <div class="app-container home">
    <div class="total-layout">
      <el-row :gutter="20">
        <el-col :span="6">
          <div class="total-frame">
            <img :src="img_home_order" class="total-icon">
            <div class="total-title">总收入</div>
            <div class="total-value">{{ totalAmount }}</div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="total-frame">
            <img :src="img_home_today_amount" class="total-icon">
            <div class="total-title">今天收入总额</div>
            <div class="total-value">￥{{ todayTotalAmount }}</div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="total-frame">
            <img :src="img_home_yesterday_amount" class="total-icon">
            <div class="total-title">昨日收入总额</div>
            <div class="total-value">￥{{ yesterdayTotalAmount }}</div>
          </div>
        </el-col>

  <!--      <el-col :xs="24" :sm="24" :md="12" :lg="8">-->
  <!--        <el-card class="update-log">-->
  <!--          <div slot="header" class="clearfix">-->
  <!--            <span>总收入</span>-->
  <!--          </div>-->
  <!--          <div class="body">-->
  <!--            <p>-->
  <!--              {{totalAmount}}-->
  <!--            </p>-->
  <!--          </div>-->
  <!--        </el-card>-->
  <!--      </el-col>-->
      </el-row>
    </div>
  </div>
</template>

<script>
import {getUserCashFlow} from "@/api/system/user";
import img_home_order_img from "@/assets/images/home_order.png";
import img_home_today_amount_img from "@/assets/images/home_today_amount.png";
import img_home_yesterday_amount_img from "@/assets/images/home_yesterday_amount.png";

export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.8.7",
      // 总流水收入
      totalAmount: 0,
      // 今日收入总额
      todayTotalAmount: 0,
      // 昨日收入总额
      yesterdayTotalAmount: 0,

      img_home_order:img_home_order_img,
      img_home_today_amount:img_home_today_amount_img,
      img_home_yesterday_amount:img_home_yesterday_amount_img,
    };
  },
  created() {
    this.getCashFlow();
  },
  mounted() {
    setInterval(this.getCashFlow, 15000); //每15s刷新列表
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
    getCashFlow(){
      getUserCashFlow().then(response => {
        this.totalAmount = response.userCashFlow.totalAmount;
        this.todayTotalAmount = response.userCashFlow.todayTotalAmount;
        this.yesterdayTotalAmount = response.userCashFlow.yesterdayTotalAmount;
      });
    },
  }
};
</script>

<style scoped lang="scss">

.app-container {
  margin-top: 40px;
  margin-left: 120px;
  margin-right: 120px;
}

.address-layout {
}

.total-layout {
  margin-top: 20px;
}

.total-frame {
  border: 1px solid #DCDFE6;
  padding: 20px;
  height: 100px;
}

.total-icon {
  color: #409EFF;
  width: 60px;
  height: 60px;
}

.total-title {
  position: relative;
  font-size: 16px;
  color: #909399;
  left: 70px;
  top: -50px;
}

.total-value {
  position: relative;
  font-size: 18px;
  color: #606266;
  left: 70px;
  top: -40px;
}
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

