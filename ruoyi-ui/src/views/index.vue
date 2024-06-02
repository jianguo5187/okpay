<template>
  <div class="app-container home">
<!--    <div class="total-layout">-->
<!--      <el-row :gutter="20">-->
<!--        <el-col :span="6">-->
<!--          <div class="total-frame">-->
<!--            <img :src="img_home_order" class="total-icon">-->
<!--            <div class="total-title">市场交易总流水</div>-->
<!--            <div class="total-value">{{ totalAmount }}</div>-->
<!--          </div>-->
<!--        </el-col>-->
<!--        <el-col :span="6">-->
<!--          <div class="total-frame">-->
<!--            <img :src="img_home_today_amount" class="total-icon">-->
<!--            <div class="total-title">今天市场交易流水</div>-->
<!--            <div class="total-value">{{ todayTotalAmount }}</div>-->
<!--          </div>-->
<!--        </el-col>-->
<!--        <el-col :span="6">-->
<!--          <div class="total-frame">-->
<!--            <img :src="img_home_yesterday_amount" class="total-icon">-->
<!--            <div class="total-title">昨日市场交易流水</div>-->
<!--            <div class="total-value">{{ yesterdayTotalAmount }}-->
<!--            <a @click.prevent="handleLink('/system/transaction-search/index')" style="font-size: 8pt;color: blue;">更多</a>-->
<!--            </div>-->
<!--&lt;!&ndash;            <router-link :to="'/system/transaction-search/index'" class="link-type">&ndash;&gt;-->
<!--&lt;!&ndash;              <span>...更多</span>&ndash;&gt;-->
<!--&lt;!&ndash;            </router-link>&ndash;&gt;-->
<!--          </div>-->
<!--        </el-col>-->

<!--  &lt;!&ndash;      <el-col :xs="24" :sm="24" :md="12" :lg="8">&ndash;&gt;-->
<!--  &lt;!&ndash;        <el-card class="update-log">&ndash;&gt;-->
<!--  &lt;!&ndash;          <div slot="header" class="clearfix">&ndash;&gt;-->
<!--  &lt;!&ndash;            <span>总收入</span>&ndash;&gt;-->
<!--  &lt;!&ndash;          </div>&ndash;&gt;-->
<!--  &lt;!&ndash;          <div class="body">&ndash;&gt;-->
<!--  &lt;!&ndash;            <p>&ndash;&gt;-->
<!--  &lt;!&ndash;              {{totalAmount}}&ndash;&gt;-->
<!--  &lt;!&ndash;            </p>&ndash;&gt;-->
<!--  &lt;!&ndash;          </div>&ndash;&gt;-->
<!--  &lt;!&ndash;        </el-card>&ndash;&gt;-->
<!--  &lt;!&ndash;      </el-col>&ndash;&gt;-->
<!--      </el-row>-->
<!--    </div>-->
    <el-row :gutter="10" style="margin-bottom:30px">
      <el-col :span="6">
        <el-card  style="color:#67C23A">
          <div><i class="el-icon-bank-card"/>市场交易总流水</div>
          <div style="padding:10px 0;text-align:center;font-weight:bold">{{totalAmount}}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card style="color:#F56C6C">
          <div><i class="el-icon-money"/>昨日市场交易流水</div>
          <div style="padding:10px 0;text-align:center;font-weight:bold">{{yesterdayTotalAmount}}
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card  style="color:#409EFF">
          <div style="color:#409EFF"><i class="el-icon-s-shop"/>今天市场交易流水</div>
          <div style="padding:10px 0;text-align:center;font-weight:bold">{{todayTotalAmount}}</div>
          <div style="float: right">
            <a @click.prevent="handleLink('/system/transaction-search/index')" style="font-size: 12pt;color: blue;">查看更多...</a>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card style="color:#F56C6C">
          <div><i class="el-icon-user-solid"/>今天转账流水</div>
          <div style="padding:10px 0;text-align:center;font-weight:bold">{{todayTotalRechargeAmount}}</div>
          <div style="float: right">
            <a @click.prevent="handleLink('/system/recharge-search/index')" style="font-size: 12pt;color: blue;">查看更多...</a>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="12">
        <div id="main" class="echarts-border" style="width:500px; height:400px"></div>
      </el-col>
      <!--    </el-row>-->
      <!--    <el-row>-->
      <el-col :span="12">
        <div id="rechargeEchart" class="echarts-border" style="width:500px; height:400px"></div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import * as echarts from 'echarts';
import {getUserCashFlow} from "@/api/system/user";
import {selectHomePageData} from "@/api/system/home";
// import img_home_order_img from "@/assets/images/home_order.png";
// import img_home_today_amount_img from "@/assets/images/home_today_amount.png";
// import img_home_yesterday_amount_img from "@/assets/images/home_yesterday_amount.png";

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
      // 今天转账流水
      todayTotalRechargeAmount:0,

      buySaleTransactionEchartTitle:[],
      totalTransactionEchartSeriesData:[],
      buyTransactionEchartSeriesData:[],
      saleTransactionEchartSeriesData:[],

      rechargeTransactionEchartTitle:[],
      totalRechargeTransactionEchartSeriesData:[],
      fromRechargeTransactionEchartSeriesData:[],
      toRechargeTransactionEchartSeriesData:[],
    };
  },
  // created() {
  //   this.getCashFlow();
  // },
  mounted() {
    this.initHome();
    setInterval(this.initHome, 15000); //每15s刷新列表
  },
  methods: {
    getCashFlow(){
      getUserCashFlow().then(response => {
        this.totalAmount = response.userCashFlow.totalAmount;
        this.todayTotalAmount = response.userCashFlow.todayTotalAmount;
        this.yesterdayTotalAmount = response.userCashFlow.yesterdayTotalAmount;
      });
    },
    handleLink(path) {
      this.$router.push({ path: path});
    },
    initHome(){
      // this.getCashFlow();
      selectHomePageData().then(response => {
        console.log("initHome");
        this.totalAmount = response.homePageData.totalAmount;
        this.todayTotalAmount = response.homePageData.todayTotalAmount;
        this.yesterdayTotalAmount = response.homePageData.yesterdayTotalAmount;
        this.todayTotalRechargeAmount = response.homePageData.todayTotalRechargeAmount;

        // this.buySaleTransactionEchartTitle = response.homePageData.buySaleTransactionEchartTitle;
        // this.totalTransactionEchartSeriesData = response.homePageData.totalTransactionEchartSeriesData;
        // this.buyTransactionEchartSeriesData = response.homePageData.buyTransactionEchartSeriesData;
        // this.saleTransactionEchartSeriesData = response.homePageData.saleTransactionEchartSeriesData;

        // this.rechargeTransactionEchartTitle = response.homePageData.rechargeTransactionEchartTitle;
        // this.totalRechargeTransactionEchartSeriesData = response.homePageData.totalRechargeTransactionEchartSeriesData;
        // this.fromRechargeTransactionEchartSeriesData = response.homePageData.fromRechargeTransactionEchartSeriesData;
        // this.toRechargeTransactionEchartSeriesData = response.homePageData.toRechargeTransactionEchartSeriesData;

        // this.upDownMoneyEchartInit();
        // this.gameRechargeEchartInit();
      });
    },
    upDownMoneyEchartInit() {
      var chartDom = document.getElementById('main');
      var myChart = echarts.init(chartDom);
      var charOption;
      charOption = {
        title: {
          text: '市场交易流水',
          // subtext: '趋势图',
          // left: 'center'
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ["总流水", "入账", "出账"]
        },
        xAxis: {
          type: 'category',
          data: this.buySaleTransactionEchartTitle,
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            data: this.totalTransactionEchartSeriesData,
            name: '总流水',
            type: 'line',
            itemStyle: {
              normal: {
                color: '#008cff', // 折线点的颜色
                lineStyle: {
                  color: '#008CFFFF' // 折线的颜色
                }
              }
            },
          },
          {
            data: this.buyTransactionEchartSeriesData,
            name: '入账',
            type: 'line',
            itemStyle: {
              normal: {
                color: '#26ff00', // 折线点的颜色
                lineStyle: {
                  color: '#26ff00' // 折线的颜色
                }
              }
            },
          },
          {
            data: this.saleTransactionEchartSeriesData,
            name: '出账',
            type: 'line',
            itemStyle: {
              normal: {
                color: '#ff0000', // 折线点的颜色
                lineStyle: {
                  color: '#ff0000' // 折线的颜色
                }
              }
            },
          },
        ]
      };
      myChart.setOption(charOption);
    },
    gameRechargeEchartInit() {
      var chartDom = document.getElementById('rechargeEchart');
      var myChart = echarts.init(chartDom);
      var charOption;
      charOption = {
        title: {
          text: '转账流水',
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ["总流水", "入账", "出账"]
        },
        xAxis: {
          type: 'category',
          data: this.rechargeTransactionEchartTitle,
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            data: this.totalRechargeTransactionEchartSeriesData,
            name: '总流水',
            type: 'line',
            itemStyle: {
              normal: {
                color: '#008cff', // 折线点的颜色
                lineStyle: {
                  color: '#008CFFFF' // 折线的颜色
                }
              }
            },
          },
          {
            data: this.toRechargeTransactionEchartSeriesData,
            name: '入账',
            type: 'line',
            itemStyle: {
              normal: {
                color: '#26ff00', // 折线点的颜色
                lineStyle: {
                  color: '#26ff00' // 折线的颜色
                }
              }
            },
          },
          {
            data: this.fromRechargeTransactionEchartSeriesData,
            name: '出账',
            type: 'line',
            itemStyle: {
              normal: {
                color: '#ff0000', // 折线点的颜色
                lineStyle: {
                  color: '#ff0000' // 折线的颜色
                }
              }
            },
          },
        ]
      };
      myChart.setOption(charOption);
    }
  },
};
</script>

<style scoped lang="scss">

//.app-container {
//  margin-top: 40px;
//  margin-left: 120px;
//  margin-right: 120px;
//}
//
//.address-layout {
//}
//
//.total-layout {
//  margin-top: 20px;
//}
//
//.total-frame {
//  border: 1px solid #DCDFE6;
//  padding: 20px;
//  height: 100px;
//}
//
//.total-icon {
//  color: #409EFF;
//  width: 60px;
//  height: 60px;
//}
//
//.total-title {
//  position: relative;
//  font-size: 16px;
//  color: #909399;
//  left: 70px;
//  top: -50px;
//}
//
//.total-value {
//  position: relative;
//  font-size: 18px;
//  color: #606266;
//  left: 70px;
//  top: -40px;
//}
//.home {
//  blockquote {
//    padding: 10px 20px;
//    margin: 0 0 20px;
//    font-size: 17.5px;
//    border-left: 5px solid #eee;
//  }
//  hr {
//    margin-top: 20px;
//    margin-bottom: 20px;
//    border: 0;
//    border-top: 1px solid #eee;
//  }
//  .col-item {
//    margin-bottom: 20px;
//  }
//
//  ul {
//    padding: 0;
//    margin: 0;
//  }
//
//  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
//  font-size: 13px;
//  color: #676a6c;
//  overflow-x: hidden;
//
//  ul {
//    list-style-type: none;
//  }
//
//  h4 {
//    margin-top: 0px;
//  }
//
//  h2 {
//    margin-top: 10px;
//    font-size: 26px;
//    font-weight: 100;
//  }
//
//  p {
//    margin-top: 10px;
//
//    b {
//      font-weight: 700;
//    }
//  }
//
//  .update-log {
//    ol {
//      display: block;
//      list-style-type: decimal;
//      margin-block-start: 1em;
//      margin-block-end: 1em;
//      margin-inline-start: 0;
//      margin-inline-end: 0;
//      padding-inline-start: 40px;
//    }
//  }
//}
</style>

