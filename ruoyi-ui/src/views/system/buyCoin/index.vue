<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="128px">
      <el-form-item label="买币用户" prop="buyUserId">
        <el-select v-model="queryParams.buyUserId" placeholder="请选择买币用户" filterable>
          <el-option
            clearable
            v-for="item in userListOptions"
            :key="item.userId"
            :label="item.nickName"
            :value="item.userId"
          ></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="买币开始日" prop="startBuyTime">
        <el-date-picker clearable
                        v-model="queryParams.startBuyTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择买币开始日">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="买币结束日" prop="endBuyTime">
        <el-date-picker clearable
                        v-model="queryParams.endBuyTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择买币结束日">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="卖币No" prop="saleNo">
        <el-input
          v-model="queryParams.saleNo"
          placeholder="请输入卖币No"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="支付方式" prop="buyType">
        <el-select
          v-model="queryParams.buyType"
          placeholder="支付方式"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.pay_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="状态" prop="urgentSaleFlg">
        <el-select
          v-model="queryParams.status"
          placeholder="状态"
          style="width: 240px"
          @change="handleQuery"
        >
          <el-option
            v-for="dict in dict.type.buy_status"
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
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['system:buyCoin:add']"-->
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
<!--          v-hasPermi="['system:buyCoin:edit']"-->
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
<!--          v-hasPermi="['system:buyCoin:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['system:buyCoin:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="buyCoinList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="买币ID" align="center" prop="buyId" />-->
<!--      <el-table-column label="卖币ID" align="center" prop="saleId" />-->
      <el-table-column label="卖币No" align="center" prop="saleNo" />
      <el-table-column label="卖币用户" align="center" prop="saleUserNickName" />
      <el-table-column label="买币用户" align="center" prop="buyUserNickName" />
      <el-table-column label="买币时间" align="center" prop="buyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.buyTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="支付方式" align="center" prop="buyType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.pay_type" :value="scope.row.buyType"/>
        </template>
      </el-table-column>
      <el-table-column label="买币金额" align="center" prop="buyAmount" />
      <el-table-column label="支付凭证" align="center" >
        <template slot-scope="scope">
          <image-preview :src="scope.row.buyVoucher" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="买币状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.buy_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--          >修改</el-button>-->
          <!-- <el-button
            v-if="scope.row.buyUserId != loginUserId && scope.row.status == '1'"
            size="mini"
            type="text"
            icon="el-icon-picture"
            @click="handleShowBuyVoucher(scope.row,'2')"
          >查看支付凭证</el-button> -->
          <el-button
            v-if="scope.row.buyUserId != loginUserId && scope.row.status == '1'"
            size="mini"
            type="text"
            icon="el-icon-finished"
            @click="handleConfirmPayment(scope.row,'2')"
          >确认收款</el-button>
          <el-button
            v-if="scope.row.buyUserId != loginUserId && scope.row.status != '9'"
            size="mini"
            type="text"
            icon="el-icon-finished"
            @click="handleConfirmPayment(scope.row,'9')"
          >买币驳回</el-button>
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
        <el-form-item label="支付凭证" prop="buyVoucher">
          <imageUpload unselectable="on" v-model="form.buyVoucher" :imgUrl="form.buyVoucher" :limit="1"></imageUpload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="modalConfirmPayment">确认收款</el-button>
        <el-button @click="cancel">关闭</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import {
  listBuyCoin,
  getBuyCoin,
  delBuyCoin,
  addBuyCoin,
  updateBuyCoin,
  listShoppingBuyCoin, confirmPayment
} from "@/api/system/buyCoin";
import {selectSaleUser} from "@/api/system/saleCoin";

export default {
  name: "BuyCoin",
  dicts: ['sale_split_type','pay_type','urgent_sale_status','buy_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 登录用户ID
      loginUserId: this.$store.state.user.id,
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
        startBuyTime: null,
        endBuyTime: null,
        saleNo: null,
        buyUserId: null,
        buyType: null,
        status: '1',
      },
      userListOptions:[],
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
    this.getUserList();
  },
  mounted() {
    setInterval(this.getList, 15000); //每15s刷新列表
  },
  methods: {
    /** 查询买币列表 */
    getList() {
      this.loading = true;
      listShoppingBuyCoin(this.queryParams).then(response => {
        this.buyCoinList = response.rows;
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
        buyVoucher: null,
        buyId: null,
        // saleUserId: null,
        // buyUserId: null,
        // buyTime: null,
        // buyType: null,
        // buyAmount: null,
        // status: null,
        // createBy: null,
        // createTime: null,
        // updateBy: null,
        // updateTime: null,
        // remark: null
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
    /** 查看支付凭证按钮操作 */
    handleShowBuyVoucher(row,status) {
      // this.$modal.confirm('是否确认已经打款').then(function() {
      //   return confirmPayment({"buyId":row.buyId,"status":status});
      // }).then(() => {
      //   this.getList();
      //   this.$modal.msgSuccess("确认打款完成");
      // }).catch((e) => {
      //   // console.log(error);
      // });
      this.reset();
      this.open = true;
      this.form.buyVoucher = row.buyVoucher;
      this.form.buyId = row.buyId;
      this.title = "查看支付凭证";
    },
    /** 确认收款按钮操作 */
    modalConfirmPayment() {
      confirmPayment({"buyId":this.form.buyId,"status":"2"}).then(response => {
        this.$modal.msgSuccess("确认打款完成成功");
        this.open = false;
        this.getList();
      });
      // this.$modal.confirm('是否确认已经打款').then(function() {
      //   cons
      //   return confirmPayment({"buyId":this.form.buyId,"status":"2"});
      // }).then(() => {
      //   this.getList();
      //   this.$modal.msgSuccess("确认打款完成");
      // }).catch((e) => {
      //   // console.log(error);
      // });
    },
    /** 确认收款按钮操作 */
    handleConfirmPayment(row,status) {
      var message1 = "";
      var message2 = "";
      if(status == '2'){
        message1 = '是否确认已经打款';
        message2 = "确认打款完成";
      }else{
        message1 = "是否确定撤销买币";
        message2 = "撤销买币完成";
      }
      this.$modal.confirm(message1).then(function() {
        return confirmPayment({"buyId":row.buyId,"status":status});
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(message2);
      }).catch((e) => {
        // console.log(error);
      });
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
