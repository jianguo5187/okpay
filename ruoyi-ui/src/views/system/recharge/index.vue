<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="充值用户ID" prop="fromUserId">
        <el-input
          v-model="queryParams.fromUserId"
          placeholder="请输入充值用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="被充值用户ID" prop="toUserId">
        <el-input
          v-model="queryParams.toUserId"
          placeholder="请输入被充值用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="充值金额" prop="rechargeAmount">
        <el-input
          v-model="queryParams.rechargeAmount"
          placeholder="请输入充值金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="充值时间" prop="rechargeTime">
        <el-date-picker clearable
          v-model="queryParams.rechargeTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择充值时间">
        </el-date-picker>
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
          v-hasPermi="['system:recharge:add']"
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
          v-hasPermi="['system:recharge:edit']"
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
          v-hasPermi="['system:recharge:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:recharge:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="rechargeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="充值ID" align="center" prop="rechargeId" />
      <el-table-column label="充值用户ID" align="center" prop="fromUserId" />
      <el-table-column label="被充值用户ID" align="center" prop="toUserId" />
      <el-table-column label="充值金额" align="center" prop="rechargeAmount" />
      <el-table-column label="充值时间" align="center" prop="rechargeTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.rechargeTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="充值方式" align="center" prop="rechargeType" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:recharge:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:recharge:remove']"
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

    <!-- 添加或修改充值对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="充值用户ID" prop="fromUserId">
          <el-input v-model="form.fromUserId" placeholder="请输入充值用户ID" />
        </el-form-item>
        <el-form-item label="被充值用户ID" prop="toUserId">
          <el-input v-model="form.toUserId" placeholder="请输入被充值用户ID" />
        </el-form-item>
        <el-form-item label="充值金额" prop="rechargeAmount">
          <el-input v-model="form.rechargeAmount" placeholder="请输入充值金额" />
        </el-form-item>
        <el-form-item label="充值时间" prop="rechargeTime">
          <el-date-picker clearable
            v-model="form.rechargeTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择充值时间">
          </el-date-picker>
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
import { listRecharge, getRecharge, delRecharge, addRecharge, updateRecharge } from "@/api/system/recharge";

export default {
  name: "Recharge",
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
      // 充值表格数据
      rechargeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fromUserId: null,
        toUserId: null,
        rechargeAmount: null,
        rechargeTime: null,
        rechargeType: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        fromUserId: [
          { required: true, message: "充值用户ID不能为空", trigger: "blur" }
        ],
        toUserId: [
          { required: true, message: "被充值用户ID不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询充值列表 */
    getList() {
      this.loading = true;
      listRecharge(this.queryParams).then(response => {
        this.rechargeList = response.rows;
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
        rechargeId: null,
        fromUserId: null,
        toUserId: null,
        rechargeAmount: null,
        rechargeTime: null,
        rechargeType: null,
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
      this.ids = selection.map(item => item.rechargeId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加充值";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const rechargeId = row.rechargeId || this.ids
      getRecharge(rechargeId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改充值";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.rechargeId != null) {
            updateRecharge(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRecharge(this.form).then(response => {
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
      const rechargeIds = row.rechargeId || this.ids;
      this.$modal.confirm('是否确认删除充值编号为"' + rechargeIds + '"的数据项？').then(function() {
        return delRecharge(rechargeIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/recharge/export', {
        ...this.queryParams
      }, `recharge_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
