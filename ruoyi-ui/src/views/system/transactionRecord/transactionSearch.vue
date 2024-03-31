<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
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
      <el-form-item label="交易类型" prop="recordType">
        <el-select
          v-model="queryParams.recordType"
          placeholder="交易类型"
          clearable
          style="width: 240px"
          @change="handleQuery">
          <el-option
            v-for="dict in dict.type.transaction_record_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-row :gutter="10" class="mb8">
      <span style="font-size: 40px;font-weight: bolder;">
        合计：
        <span :style="totalAmount>0?'color: green;':'color: red;'">
          {{totalAmount}}
        </span>
      </span>
    </el-row>

    <el-table v-loading="loading" :data="transactionRecordList">
      <el-table-column label="交易时间" align="center" prop="recordTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.recordTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="交易用户" align="center" prop="userNickName" />
      <el-table-column label="交易类型" align="center" prop="recordTypeName" />
      <el-table-column label="交易金额" align="center" prop="showRecordAmount">
        <template slot-scope="scope">
          <span :style="scope.row.showRecordAmount>0?'font-size:25px;color:green;':'font-size:25px;color:red;'" >{{scope.row.showRecordAmount}}</span>
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
  </div>
</template>

<script>
import {
  listTransactionRecord,
  getTransactionRecord,
  delTransactionRecord,
  addTransactionRecord,
  updateTransactionRecord,
  getUserTotalAmount
} from "@/api/system/transactionRecord";
import {selectSaleUser} from "@/api/system/saleCoin";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "TransactionRecord",
  components: {Treeselect},
  dicts: ['transaction_record_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 登录用户ID
      loginUserId: this.$store.state.user.id,
      // 登录用户Name
      loginUserName: this.$store.state.user.name,
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
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        recordType: null,
        startTime:this.defaultStartTime,
        endTime:this.defaultEndTime,
        transactionFlg:"1",
      },
      userListOptions:[],
      // 默认字典类型
      defaultUserId: 0,
      defaultStartTime: null,
      defaultEndTime: null,
      totalAmount: 0,
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
    this.getList();
    // this.getUserList();
  },
  methods: {
    /** 查询交易记录列表 */
    getList() {
      this.loading = true;console.log(123);
      this.getTotalAmount();
      listTransactionRecord(this.queryParams).then(response => {
        this.transactionRecordList = response.rows;
        this.total = response.total;
        this.loading = false;
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
      getUserTotalAmount(this.queryParams).then(response => {
        this.totalAmount = parseInt(response.totalAmount);
      });
    },
    // 取消按钮
    // cancel() {
    //   this.open = false;
    //   this.reset();
    // },
    // // 表单重置
    // reset() {
    //   this.form = {
    //     recordId: null,
    //     userId: null,
    //     recordTime: null,
    //     recordType: null,
    //     buyId: null,
    //     saleId: null,
    //     rechargeId: null,
    //     recordAmount: null,
    //     createBy: null,
    //     createTime: null,
    //     remark: null
    //   };
    //   this.resetForm("form");
    // },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    // handleSelectionChange(selection) {
    //   this.ids = selection.map(item => item.recordId)
    //   this.single = selection.length!==1
    //   this.multiple = !selection.length
    // },
    // /** 新增按钮操作 */
    // handleAdd() {
    //   this.reset();
    //   this.open = true;
    //   this.title = "添加交易记录";
    // },
    /** 修改按钮操作 */
    // handleUpdate(row) {
    //   this.reset();
    //   const recordId = row.recordId || this.ids
    //   getTransactionRecord(recordId).then(response => {
    //     this.form = response.data;
    //     this.open = true;
    //     this.title = "修改交易记录";
    //   });
    // },
    /** 提交按钮 */
    // submitForm() {
    //   this.$refs["form"].validate(valid => {
    //     if (valid) {
    //       if (this.form.recordId != null) {
    //         updateTransactionRecord(this.form).then(response => {
    //           this.$modal.msgSuccess("修改成功");
    //           this.open = false;
    //           this.getList();
    //         });
    //       } else {
    //         addTransactionRecord(this.form).then(response => {
    //           this.$modal.msgSuccess("新增成功");
    //           this.open = false;
    //           this.getList();
    //         });
    //       }
    //     }
    //   });
    // },
    /** 删除按钮操作 */
    // handleDelete(row) {
    //   const recordIds = row.recordId || this.ids;
    //   this.$modal.confirm('是否确认删除交易记录编号为"' + recordIds + '"的数据项？').then(function() {
    //     return delTransactionRecord(recordIds);
    //   }).then(() => {
    //     this.getList();
    //     this.$modal.msgSuccess("删除成功");
    //   }).catch(() => {});
    // },
    /** 导出按钮操作 */
    // handleExport() {
    //   this.download('system/transactionRecord/export', {
    //     ...this.queryParams
    //   }, `transactionRecord_${new Date().getTime()}.xlsx`)
    // }
  }
};
</script>
