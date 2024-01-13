<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="卖币ID" prop="saleId">
        <el-input
          v-model="queryParams.saleId"
          placeholder="请输入卖币ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="卖币用户ID" prop="saleUserId">
        <el-input
          v-model="queryParams.saleUserId"
          placeholder="请输入卖币用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="买币用户ID" prop="buyUserId">
        <el-input
          v-model="queryParams.buyUserId"
          placeholder="请输入买币用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="买币时间" prop="buyTime">
        <el-date-picker clearable
          v-model="queryParams.buyTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择买币时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="买币金额" prop="buyAmount">
        <el-input
          v-model="queryParams.buyAmount"
          placeholder="请输入买币金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:buyCoin:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:buyCoin:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:buyCoin:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:buyCoin:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="buyCoinList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="买币ID" align="center" prop="buyId" />
      <el-table-column label="卖币ID" align="center" prop="saleId" />
      <el-table-column label="卖币用户ID" align="center" prop="saleUserId" />
      <el-table-column label="买币用户ID" align="center" prop="buyUserId" />
      <el-table-column label="买币时间" align="center" prop="buyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.buyTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="支付方式" align="center" prop="buyType" />
      <el-table-column label="买币金额" align="center" prop="buyAmount" />
      <el-table-column label="买币状态" align="center" prop="status" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:buyCoin:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:buyCoin:remove']"
          >删除</el-button>
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

    <!-- 添加或修改买币对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="卖币ID" prop="saleId">
          <el-input v-model="form.saleId" placeholder="请输入卖币ID" />
        </el-form-item>
        <el-form-item label="卖币用户ID" prop="saleUserId">
          <el-input v-model="form.saleUserId" placeholder="请输入卖币用户ID" />
        </el-form-item>
        <el-form-item label="买币用户ID" prop="buyUserId">
          <el-input v-model="form.buyUserId" placeholder="请输入买币用户ID" />
        </el-form-item>
        <el-form-item label="买币时间" prop="buyTime">
          <el-date-picker clearable
            v-model="form.buyTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择买币时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="买币金额" prop="buyAmount">
          <el-input v-model="form.buyAmount" placeholder="请输入买币金额" />
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
import { listBuyCoin, getBuyCoin, delBuyCoin, addBuyCoin, updateBuyCoin } from "@/api/system/buyCoin";

export default {
  name: "BuyCoin",
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
      // 买币表格数据
      buyCoinList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        saleId: null,
        saleUserId: null,
        buyUserId: null,
        buyTime: null,
        buyType: null,
        buyAmount: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        saleId: [
          { required: true, message: "卖币ID不能为空", trigger: "blur" }
        ],
        saleUserId: [
          { required: true, message: "卖币用户ID不能为空", trigger: "blur" }
        ],
        buyUserId: [
          { required: true, message: "买币用户ID不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询买币列表 */
    getList() {
      this.loading = true;
      listBuyCoin(this.queryParams).then(response => {
        this.buyCoinList = response.rows;
        this.total = response.total;
        this.loading = false;
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
        buyId: null,
        saleId: null,
        saleUserId: null,
        buyUserId: null,
        buyTime: null,
        buyType: null,
        buyAmount: null,
        status: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
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
      this.ids = selection.map(item => item.buyId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加买币";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const buyId = row.buyId || this.ids
      getBuyCoin(buyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改买币";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.buyId != null) {
            updateBuyCoin(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBuyCoin(this.form).then(response => {
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
      const buyIds = row.buyId || this.ids;
      this.$modal.confirm('是否确认删除买币编号为"' + buyIds + '"的数据项？').then(function() {
        return delBuyCoin(buyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/buyCoin/export', {
        ...this.queryParams
      }, `buyCoin_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
