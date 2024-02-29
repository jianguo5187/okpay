<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户" prop="userId">
        <el-select v-model="queryParams.userId" placeholder="请选择用户"
          @change="handleQuery">
          <el-option
            clearable
            v-for="item in userListOptions"
            :key="item.userId"
            :label="item.nickName"
            :value="item.userId"
          ></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="状态"
          style="width: 240px"
          @change="handleQuery"
        >
          <el-option
            v-for="dict in dict.type.pay_type_approve"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
<!-- 
      <el-form-item label="支付方式填充信息" prop="payRemark">
        <el-input
          v-model="queryParams.payRemark"
          placeholder="请输入支付方式填充信息"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="收款码图片地址" prop="payImg">
        <el-input
          v-model="queryParams.payImg"
          placeholder="请输入收款码图片地址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="最后登录IP" prop="loginIp">
        <el-input
          v-model="queryParams.loginIp"
          placeholder="请输入最后登录IP"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="最后登录时间" prop="loginDate">
        <el-date-picker clearable
          v-model="queryParams.loginDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择最后登录时间">
        </el-date-picker>
      </el-form-item> -->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <el-row :gutter="10" class="mb8">
      <!-- <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:payApprove:add']"
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
          v-hasPermi="['system:payApprove:edit']"
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
          v-hasPermi="['system:payApprove:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:payApprove:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="payApproveList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="承认ID" align="center" prop="payTypeApproveId" /> -->
      <el-table-column label="用户ID" align="center" prop="nickName" />
      <el-table-column label="支付方式" align="center" prop="payType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.pay_type" :value="scope.row.payType"/>
        </template>
      </el-table-column>
      <el-table-column label="收款码图片" align="center" >
      <template slot-scope="scope">
        <image-preview :src="scope.row.payImg" :width="50" :height="50"/>
        </template> 
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.status == '0'"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row,'1')"
            v-hasPermi="['system:payApprove:edit']"
          >审核</el-button>
          <el-button
            v-if="scope.row.status == '0'"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleUpdate(scope.row,'9')"
            v-hasPermi="['system:payApprove:remove']"
          >取消</el-button>
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

    <!-- 添加或修改用户支付方式审核对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户ID" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户ID" />
        </el-form-item>
       
        <el-form-item label="支付方式填充信息" prop="payRemark">
          <el-input v-model="form.payRemark" placeholder="请输入支付方式填充信息" />
        </el-form-item>
        
        <el-form-item label="微信收款码" prop="payImg">
          <imageUpload v-model="form.payImg" :imgUrl="form.payImg" :limit="1"></imageUpload>
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
import { listPayApprove, getPayApprove, delPayApprove, addPayApprove, updatePayApprove, updatePayType } from "@/api/system/payApprove";
import {selectSaleUser} from "@/api/system/saleCoin";

export default {
  name: "PayApprove",
  dicts: ['pay_type_approve','pay_type'],
  data() {
    return {
      // 遮罩层
      baseApi: process.env.VUE_APP_BASE_API,
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
      // 用户支付方式审核表格数据
      payApproveList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: this.$store.state.user.id,
        status: '0',
        payType: null,
        payRemark: null,
        payImg: null,
        loginIp: null,
        loginDate: null,
      },
      userListOptions:[],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户ID不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getUserList();
  },
  mounted() {
    setInterval(this.getList, 15000); //每15s刷新列表
  },
  methods: {
    /** 查询用户支付方式审核列表 */
    getList() {
      this.loading = true;
      listPayApprove(this.queryParams).then(response => {
        this.payApproveList = response.rows;
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
        payTypeApproveId: null,
        userId: null,
        payType: null,
        payRemark: null,
        payImg: null,
        status: null,
        delFlag: null,
        loginIp: null,
        loginDate: null,
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
      this.ids = selection.map(item => item.payTypeApproveId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加用户支付方式审核";
    },
    /** 修改按钮操作 */
    handleUpdate(row,status) {
      this.$modal.confirm('是否承认支付图片有效').then(function() {
        return updatePayType({"payTypeApproveId":row.payTypeApproveId,"status":status});
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("承认完成");
      }).catch((e) => {
        // console.log(error);
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.payTypeApproveId != null) {
            updatePayApprove(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPayApprove(this.form).then(response => {
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
      const payTypeApproveIds = row.payTypeApproveId || this.ids;
      this.$modal.confirm('是否确认删除用户支付方式审核编号为"' + payTypeApproveIds + '"的数据项？').then(function() {
        return delPayApprove(payTypeApproveIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/payApprove/export', {
        ...this.queryParams
      }, `payApprove_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
