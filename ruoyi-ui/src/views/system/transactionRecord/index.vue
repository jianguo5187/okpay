<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="128px">
      <el-form-item label="交易用户" prop="userId">
        <el-select v-model="queryParams.userId" placeholder="请选择买币用户" @change="handleQuery">
          <el-option
            clearable
            v-for="item in userListOptions"
            :key="item.userId"
            :label="item.nickName"
            :value="item.userId"
          ></el-option>
        </el-select>
      </el-form-item>
<!--      <el-form-item label="交易用户ID" prop="userId">-->
<!--        <el-input-->
<!--          v-model="queryParams.userId"-->
<!--          placeholder="请输入交易用户ID"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="交易时间" prop="recordTime">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.recordTime"-->
<!--          type="date"-->
<!--          value-format="yyyy-MM-dd"-->
<!--          placeholder="请选择交易时间">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="买币ID" prop="buyId">-->
<!--        <el-input-->
<!--          v-model="queryParams.buyId"-->
<!--          placeholder="请输入买币ID"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="卖币ID" prop="saleId">-->
<!--        <el-input-->
<!--          v-model="queryParams.saleId"-->
<!--          placeholder="请输入卖币ID"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="充值ID" prop="rechargeId">-->
<!--        <el-input-->
<!--          v-model="queryParams.rechargeId"-->
<!--          placeholder="请输入充值ID"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="交易金额" prop="recordAmount">-->
<!--        <el-input-->
<!--          v-model="queryParams.recordAmount"-->
<!--          placeholder="请输入交易金额"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['system:transactionRecord:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['system:transactionRecord:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['system:transactionRecord:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['system:transactionRecord:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>
    <span style="font-size: 20px;font-weight: bolder;color: red;">点击名称，查看流水明细</span>
    <el-table v-loading="loading" :data="transactionRecordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="交易用户" align="center" prop="userNickName">
        <template slot-scope="scope">
          <router-link :to="'/system/transaction-detail/index/' + scope.row.userId + '/' + scope.row.recordAmount" class="link-type">
            <span>{{ scope.row.userNickName }}</span>
          </router-link>
        </template>
      </el-table-column>
      <el-table-column label="流水合计" align="center" prop="recordAmount">
        <template slot-scope="scope">
          <span :style="scope.row.recordAmount>0?'font-size:25px;color:green;':'font-size:25px;color:red;'" >{{scope.row.recordAmount}}</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['system:transactionRecord:edit']"-->
<!--          >修改</el-button>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['system:transactionRecord:remove']"-->
<!--          >删除</el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改交易记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="交易用户ID" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入交易用户ID" />
        </el-form-item>
        <el-form-item label="交易时间" prop="recordTime">
          <el-date-picker clearable
            v-model="form.recordTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择交易时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="买币ID" prop="buyId">
          <el-input v-model="form.buyId" placeholder="请输入买币ID" />
        </el-form-item>
        <el-form-item label="卖币ID" prop="saleId">
          <el-input v-model="form.saleId" placeholder="请输入卖币ID" />
        </el-form-item>
        <el-form-item label="充值ID" prop="rechargeId">
          <el-input v-model="form.rechargeId" placeholder="请输入充值ID" />
        </el-form-item>
        <el-form-item label="交易金额" prop="recordAmount">
          <el-input v-model="form.recordAmount" placeholder="请输入交易金额" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listTransactionRecord,
  getTransactionRecord,
  delTransactionRecord,
  addTransactionRecord,
  updateTransactionRecord,
  userTransactionRecord
} from "@/api/system/transactionRecord";
import {selectSaleUser} from "@/api/system/saleCoin";

export default {
  name: "TransactionRecord",
  data() {
    return {
      // 遮罩层
      loading: true,
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
        recordType: null
      },
      userListOptions:[],
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
    this.getList();
    this.getUserList();
  },
  methods: {
    /** 查询交易记录列表 */
    getList() {
      this.loading = true;
      userTransactionRecord(this.queryParams).then(response => {
        this.transactionRecordList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getUserList(){
      selectSaleUser().then(response => {
        this.userListOptions = response.rows;;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        recordId: null,
        userId: null,
        recordTime: null,
        recordType: null,
        buyId: null,
        saleId: null,
        rechargeId: null,
        recordAmount: null,
        createBy: null,
        createTime: null,
        remark: null
      };
      this.resetForm("form");
    },
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
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.recordId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加交易记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const recordId = row.recordId || this.ids
      getTransactionRecord(recordId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改交易记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.recordId != null) {
            updateTransactionRecord(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTransactionRecord(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const recordIds = row.recordId || this.ids;
      this.$modal.confirm('是否确认删除交易记录编号为"' + recordIds + '"的数据项？').then(function() {
        return delTransactionRecord(recordIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/transactionRecord/export', {
        ...this.queryParams
      }, `transactionRecord_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
