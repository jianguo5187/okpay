<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="108px">
      <el-form-item label="统计开始日" prop="startTime">
        <el-date-picker clearable
                        v-model="queryParams.startTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="统计开始日">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="统计束日" prop="endTime">
        <el-date-picker clearable
                        v-model="queryParams.endTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="统计结束日">
        </el-date-picker>
      </el-form-item>

      <el-form-item label="卖币用户" prop="userId">
        <treeselect
          v-model="queryParams.userId"
          :options="userListOptions"
          :normalizer="normalizer"
          @select="handleQuery"
          :show-count="true"
          placeholder="请选择卖币用户"
          style="width: 320px;"/>
      </el-form-item>

<!--      <el-form-item label="交易类型" prop="recordType">-->
<!--        <el-select-->
<!--          v-model="queryParams.recordType"-->
<!--          placeholder="交易类型"-->
<!--          clearable-->
<!--          style="width: 240px"-->
<!--          @change="handleQuery">-->
<!--          <el-option-->
<!--            v-for="dict in dict.type.transaction_record_type"-->
<!--            :key="dict.value"-->
<!--            :label="dict.label"-->
<!--            :value="dict.value"-->
<!--          />-->
<!--        </el-select>-->
<!--      </el-form-item>-->

      <el-form-item label="显示商户流水" prop="showMerchantFlg" v-if="showMerchantFlg">
        <el-switch v-model="queryParams.showMerchantFlg" @change="handleQuery"></el-switch>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" size="mini" @click="handleTodayQuery">今日流水</el-button>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <span style="font-size: 40px;font-weight: bolder;">
        合计：
        <span>
          {{totalAmount}}
        </span>
      </span>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-row :gutter="10" class="mb8" style="font-size: 30px;">
      <span style="font-weight: bolder;">
        入：
        <span style="color: green;">
          {{totalInAmount}}
        </span>
      </span>

      <span style="font-weight: bolder;">
        出：
        <span style="color: red;">
          {{totalOutAmount}}
        </span>
      </span>
    </el-row>

    <el-table v-loading="loading" :data="transactionRecordList" :cell-style="mainCellStyle">
      <el-table-column label="用户名" align="center" prop="userId">
        <template slot-scope="scope">
          <span>{{ scope.row.nickName }}(<span style="color: red">{{ scope.row.userId }}</span>)</span>
        </template>
      </el-table-column>
      <el-table-column label="用户类型" align="center" prop="userType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.user_type" :value="scope.row.userType"/>
        </template>
      </el-table-column>
      <el-table-column label="入账" align="center" prop="transactionBuyAmount" />
      <el-table-column label="出账" align="center" prop="transactionSaleAmount" />
      <el-table-column label="总流水" align="center" prop="transactionTotalAmount"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <span v-if="scope.row.userId == loginUserId">自身流水记录</span>
          <el-button
            v-else-if="queryParams.showMerchantFlg"
            size="mini"
            type="text"
            icon="el-icon-finished"
            @click="showMerchantDetail(scope.row)"
          >查看商户流水明细</el-button>
          <el-button
            v-if="!queryParams.showMerchantFlg && scope.row.userType == '03'"
            size="mini"
            type="text"
            icon="el-icon-finished"
            @click="showProxyDetail(scope.row)"
          >查看代理流水明细</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <el-dialog :title="merchantDialogTitle" :visible.sync="merchantDialogOpen" width="1400px" append-to-body>
      <el-row :gutter="10" class="mb8">
      <span style="font-size: 40px;font-weight: bolder;">
        合计：
        <span>
          {{merchantTotalAmount}}
        </span>
      </span>
      </el-row>

      <el-row :gutter="10" class="mb8" style="font-size: 30px;">
      <span style="font-weight: bolder;">
        买：
        <span style="color: green;">
          {{merchantotalInAmount}}
        </span>
      </span>

        <span style="font-weight: bolder;">
        卖：
        <span style="color: red;">
          {{merchantotalOutAmount}}
        </span>
      </span>
      </el-row>
      <el-table v-loading="loading" :data="merchantTransactionList" :cell-style="merchantCellStyle">
        <el-table-column label="用户名" align="center" prop="userId">
          <template slot-scope="scope">
            <span>{{ scope.row.nickName }}(<span style="color: red">{{ scope.row.userId }}</span>)</span>
          </template>
        </el-table-column>
        <el-table-column label="用户类型" align="center" prop="userType">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.user_type" :value="scope.row.userType"/>
          </template>
        </el-table-column>
        <el-table-column label="入账" align="center" prop="transactionBuyAmount" />
        <el-table-column label="出账" align="center" prop="transactionSaleAmount" />
        <el-table-column label="总流水" align="center" prop="transactionTotalAmount"/>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <span v-if="scope.row.userId == merchantSelfUserId">自身流水记录</span>
            <el-button
              v-else
              size="mini"
              type="text"
              icon="el-icon-finished"
              @click="showProxyDetail(scope.row)"
            >查看代理流水明细</el-button>
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="merchantTransactionTotal>0"
        :total="merchantTransactionTotal"
        :page.sync="dialogMerchantTransactionQueryParams.pageNum"
        :limit.sync="dialogMerchantTransactionQueryParams.pageSize"
        @pagination="getMerchantTransactionList"
      />
    </el-dialog>


    <el-dialog :title="proxyDialogTitle" :visible.sync="proxyDialogOpen" width="1400px" append-to-body>
      <el-row :gutter="10" class="mb8">
      <span style="font-size: 40px;font-weight: bolder;">
        合计：
        <span>
          {{proxyTotalAmount}}
        </span>
      </span>
      </el-row>

      <el-row :gutter="10" class="mb8" style="font-size: 30px;">
      <span style="font-weight: bolder;">
        买：
        <span style="color: green;">
          {{proxyotalInAmount}}
        </span>
      </span>

        <span style="font-weight: bolder;">
        卖：
        <span style="color: red;">
          {{proxyotalOutAmount}}
        </span>
      </span>
      </el-row>
      <el-table v-loading="loading" :data="proxyTransactionList" :cell-style="proxyCellStyle">
        <el-table-column label="用户名" align="center" prop="userId">
          <template slot-scope="scope">
            <span>{{ scope.row.nickName }}(<span style="color: red">{{ scope.row.userId }}</span>)</span>
          </template>
        </el-table-column>
        <el-table-column label="用户类型" align="center" prop="userType">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.user_type" :value="scope.row.userType"/>
          </template>
        </el-table-column>
        <el-table-column label="入账" align="center" prop="transactionBuyAmount" />
        <el-table-column label="出账" align="center" prop="transactionSaleAmount" />
        <el-table-column label="总流水" align="center" prop="transactionTotalAmount"/>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <span v-if="scope.row.userId == proxySelfUserId">自身流水记录</span>
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="proxyTransactionTotal>0"
        :total="proxyTransactionTotal"
        :page.sync="dialogProxyTransactionQueryParams.pageNum"
        :limit.sync="dialogProxyTransactionQueryParams.pageSize"
        @pagination="getProxyTransactionList"
      />
    </el-dialog>
  </div>
</template>

<script>
import {getUserRechargeTotalAmount, listUserRechargeTransactionMoney} from "@/api/system/transactionRecord";
import {selectSaleUser} from "@/api/system/saleCoin";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "rechargeTransactionSearch",
  components: {Treeselect},
  dicts: ['transaction_record_type', 'user_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 登录用户ID
      loginUserId: this.$store.state.user.id,
      // 登录用户Name
      loginUserName: this.$store.state.user.nickName,
      // 登录用户ID
      loginUserType: this.$store.state.user.userType,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 交易记录表格数据
      transactionRecordList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      showMerchantFlg:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        recordType: null,
        startTime:this.defaultStartTime,
        endTime:this.defaultEndTime,
        transactionFlg:"1",
        showMerchantFlg:false,
        userType:null,
        selfUserId:null,
        merchantSearchFlg:null,
      },
      // 商户弹出层标题
      merchantDialogTitle: "",
      // 是否显示商户弹出层
      merchantDialogOpen: false,
      // 商户流水表格数据
      merchantTransactionList:[],
      // 商户层用户ID
      merchantSelfUserId: null,
      // 商户数据条数
      merchantTransactionTotal: 0,
      dialogMerchantTransactionQueryParams: {
        pageNum: 1,
        pageSize: 10,
        parentUserId: null,
        recordType: null,
        startTime:null,
        endTime:null,
        transactionFlg:"1",
        userType:null,
        selfUserId:null,
      },
      // 代理弹出层标题
      proxyDialogTitle: "",
      // 是否显示代理弹出层
      proxyDialogOpen: false,
      // 代理流水表格数据
      proxyTransactionList:[],
      // 代理层用户ID
      proxySelfUserId: null,
      // 代理数据条数
      proxyTransactionTotal: 0,
      dialogProxyTransactionQueryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        recordType: null,
        startTime:null,
        endTime:null,
        transactionFlg:"1",
        userType:null,
        selfUserId:null,
      },
      userListOptions:[],
      // 默认字典类型
      defaultUserId: 0,
      defaultStartTime: null,
      defaultEndTime: null,
      totalAmount: 0,
      totalInAmount: 0,
      totalOutAmount: 0,
      merchantTotalAmount: 0,
      merchantotalInAmount: 0,
      merchantotalOutAmount: 0,
      proxyTotalAmount: 0,
      proxyotalInAmount: 0,
      proxyotalOutAmount: 0,
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "交易用户ID不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.defaultStartTime = this.getCurrentDate();
    this.defaultEndTime = this.getCurrentDate();
    this.queryParams.startTime = this.defaultStartTime;
    this.queryParams.endTime = this.defaultEndTime;
    this.queryParams.selfUserId = this.loginUserId;
    if(this.loginUserId == 1 || this.loginUserId == 2){
      this.showMerchantFlg = true;
    }
    this.getList();
    this.getUserList();
  },
  methods: {
    /** 查询交易记录列表 */
    getList() {
      this.loading = true;console.log(123);
      if(this.queryParams.showMerchantFlg){
        this.queryParams.userType = "02";
      }else{
        this.queryParams.userType = "03";
      }
      this.getTotalAmount();
      listUserRechargeTransactionMoney(this.queryParams).then(response => {
        this.transactionRecordList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    mainCellStyle({ row, column, rowIndex, columnIndex }){
      if(row.userId == this.loginUserId){
        return 'background-color: #f0f9eb;';
      }
    },
    /** 转换菜单数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.userId,
        label: node.nickName,
        children: node.children
      };
    },
    getUserList(){
      selectSaleUser().then(response => {
        this.userListOptions = [];
        const menu = { userId: this.loginUserId, nickName: this.loginUserName, children: [] };
        menu.children = this.handleTree(response.rows, "userId", "parentUserId");
        this.userListOptions.push(menu);
      });
    },
    getYesterdayDate() {
      const today = new Date();
      const yesterday = new Date(today);
      yesterday.setDate(yesterday.getDate() - 1);
      return yesterday.toISOString().split('T')[0];
    },
    getCurrentDate() {
      const now = new Date();
      const year = now.getFullYear();
      let month = String(now.getMonth() + 1).padStart(2, '0');
      let day = String(now.getDate()).padStart(2, '0');
      return `${year}-${month}-${day}`;
    },
    getTotalAmount(){
      getUserRechargeTotalAmount(this.queryParams).then(response => {
        this.totalAmount = parseFloat(response.totalAmount);
        this.totalInAmount = parseFloat(response.totalInAmount);
        this.totalOutAmount = parseFloat(response.totalOutAmount);
      });
    },
    handleTodayQuery(){
      this.queryParams.startTime = this.defaultStartTime;
      this.queryParams.endTime = this.defaultEndTime;
      this.getList();
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.loading = true;
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    showMerchantDetail(row){
      this.merchantDialogTitle = "商户流水明细";
      this.merchantDialogOpen = true;
      this.merchantTransactionList = null;
      this.merchantTotalAmount = 0;
      this.merchantotalInAmount = 0;
      this.merchantotalOutAmount = 0;

      this.dialogMerchantTransactionQueryParams.parentUserId = row.userId;
      this.dialogMerchantTransactionQueryParams.userType = "03";
      this.dialogMerchantTransactionQueryParams.startTime = this.queryParams.startTime;
      this.dialogMerchantTransactionQueryParams.endTime = this.queryParams.endTime;
      this.dialogMerchantTransactionQueryParams.pageNum = 1;
      this.dialogMerchantTransactionQueryParams.selfUserId = row.userId;

      this.merchantSelfUserId = row.userId;

      this.getMerchantTransactionList();
    },
    /** 查询商户交易记录列表 */
    getMerchantTransactionList() {
      this.getMerchantTotalAmount();
      listUserRechargeTransactionMoney(this.dialogMerchantTransactionQueryParams).then(response => {
        this.merchantTransactionList = response.rows;
        this.merchantTransactionTotal = response.total;
        this.loading = false;
      });
    },
    merchantCellStyle({ row, column, rowIndex, columnIndex }){
      if(row.userId == this.merchantSelfUserId){
        return 'background-color: #f0f9eb;';
      }
    },
    getMerchantTotalAmount(){
      getUserRechargeTotalAmount(this.dialogMerchantTransactionQueryParams).then(response => {
        this.merchantTotalAmount = parseFloat(response.totalAmount);
        this.merchantotalInAmount = parseFloat(response.totalInAmount);
        this.merchantotalOutAmount = parseFloat(response.totalOutAmount);
      });
    },
    showProxyDetail(row){

      this.proxyDialogTitle = "客户流水明细";
      this.proxyDialogOpen = true;
      this.proxyTransactionList = null;
      this.proxyTotalAmount = 0;
      this.proxyotalInAmount = 0;
      this.proxyotalOutAmount = 0;

      this.dialogProxyTransactionQueryParams.parentUserId = row.userId;
      this.dialogProxyTransactionQueryParams.userType = "04";
      this.dialogProxyTransactionQueryParams.startTime = this.queryParams.startTime;
      this.dialogProxyTransactionQueryParams.endTime = this.queryParams.endTime;
      this.dialogProxyTransactionQueryParams.pageNum = 1;
      this.dialogProxyTransactionQueryParams.selfUserId = row.userId;

      this.proxySelfUserId = row.userId;

      this.getProxyTransactionList();
    },
    /** 查询客户交易记录列表 */
    getProxyTransactionList() {
      this.getProxyTotalAmount();
      listUserRechargeTransactionMoney(this.dialogProxyTransactionQueryParams).then(response => {
        this.proxyTransactionList = response.rows;
        this.proxyTransactionTotal = response.total;
        this.loading = false;
      });
    },
    proxyCellStyle({ row, column, rowIndex, columnIndex }){
      if(row.userId == this.proxySelfUserId){
        return 'background-color: #f0f9eb;';
      }
    },
    getProxyTotalAmount(){
      getUserRechargeTotalAmount(this.dialogProxyTransactionQueryParams).then(response => {
        this.proxyTotalAmount = parseFloat(response.totalAmount);
        this.proxyotalInAmount = parseFloat(response.totalInAmount);
        this.proxyotalOutAmount = parseFloat(response.totalOutAmount);
      });
    },
  }
};
</script>
