<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="128px">
      <el-form-item label="卖币开始日" prop="startSaleTime">
        <el-date-picker clearable
          v-model="queryParams.startSaleTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择卖币开始日">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="卖币结束日" prop="endSaleTime">
        <el-date-picker clearable
                        v-model="queryParams.endSaleTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择卖币结束日">
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

      <el-form-item label="卖币用户" prop="saleUserId">
        <el-select v-model="queryParams.saleUserId" placeholder="请选择卖币用户">
          <el-option
            clearable
            v-for="item in userListOptions"
            :key="item.userId"
            :label="item.nickName"
            :value="item.userId"
          ></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="是否可拆分" prop="saleSplitType">
        <el-select
          v-model="queryParams.saleSplitType"
          placeholder="拆分类型"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.sale_split_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="支持支付方式" prop="supportBuyType">
        <el-select
          v-model="queryParams.supportBuyType"
          placeholder="支持支付方式"
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

      <el-form-item label="加急销售" prop="urgentSaleFlg">
        <el-select
          v-model="queryParams.urgentSaleFlg"
          placeholder="加急销售"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.urgent_sale_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="状态"
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.sale_status"
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
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >卖币</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['system:saleCoin:edit']"-->
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
<!--          v-hasPermi="['system:saleCoin:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['system:saleCoin:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="saleCoinList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="卖币ID" align="center" prop="saleId" />-->
      <el-table-column label="卖币No" align="center" prop="saleNo" />
      <el-table-column label="卖币时间" align="center" prop="saleTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.saleTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="卖币用户" align="center" prop="saleUserNickName" />
      <el-table-column label="拆分类型" align="center" prop="saleSplitType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sale_split_type" :value="scope.row.saleSplitType"/>
        </template>
      </el-table-column>
      <el-table-column label="支持支付类型" align="center" prop="supportBuyTypeName" />
<!--      <el-table-column label="卖币金额" align="center" prop="saleAmount" />-->
      <el-table-column label="可购买金额" align="center" prop="remainAmount" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sale_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="加急销售" align="center" prop="urgentSaleFlg">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.urgent_sale_status" :value="scope.row.urgentSaleFlg"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="卖币状态" align="center" prop="status"/>-->
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.saleUserId != loginUserId"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleBuy(scope.row)"
          >购买</el-button>
          <el-button
            v-if="scope.row.status != '9'"
            size="mini"
            type="text"
            icon="el-icon-s-order"
            @click="handleBuy(scope.row)"
          >购买明细</el-button>
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

    <!-- 添加或修改卖币对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1200px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="180px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="卖币No" prop="saleNo" >
              <el-input v-model="form.saleNo" placeholder="请输入内容" :readOnly="true" disabled />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="卖币时间" prop="saleTime">
              <el-date-picker clearable
                              v-model="form.saleTime"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="请选择卖币时间"
                              :readOnly="true" disabled >
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="卖币用户" prop="saleUserNickName">
              <el-input v-model="form.saleUserNickName" :readOnly="true" disabled/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="可交易金额" prop="remainAmount">
              <el-input-number v-model="form.remainAmount" :readOnly="true" disabled />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="支持支付类型">
              <el-select v-model="form.supportBuyTypeArg" multiple placeholder="请选择角色" :readOnly="true" :disabled="true">
                <el-option
                  v-for="item in buyTypeOptions"
                  :key="item.dictValue"
                  :label="item.dictLabel"
                  :value="item.dictValue"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="12" v-if="supportWechatPayFlg">
            <el-form-item label="微信收款码" prop="wechatPayImg">
              <imageUpload v-model="form.wechatPayImg" :imgUrl="form.wechatPayImg" :limit="1" :readOnly="true" :disabled="true"></imageUpload>
            </el-form-item>
          </el-col>
          <el-col :span="12" v-if="supportAlipayFlg">
            <el-form-item label="支付宝收款码" prop="alipayImg">
              <imageUpload v-model="form.alipayImg" :imgUrl="form.alipayImg" :limit="1" :readOnly="true" :disabled="true"></imageUpload>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="supportUnionPayFlg">
          <el-col :span="12">
            <el-form-item label="银联收款户名" prop="unionpayAccount">
              <el-input v-model="form.unionpayAccount" placeholder="请输入银联收款户名" maxlength="30" :readOnly="true" :disabled="true"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="银联收款卡号" prop="unionpayCard">
              <el-input v-model="form.unionpayCard" placeholder="请输入银联收款卡号" maxlength="20" :readOnly="true" :disabled="true"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="是否可拆分">
              <el-select v-model="form.saleSplitType"  :readOnly="true" disabled>
                <el-option
                  v-for="dict in dict.type.sale_split_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="加急销售">
              <el-select v-model="form.urgentSaleFlg"  :readOnly="true" disabled>
                <el-option
                  v-for="dict in dict.type.urgent_sale_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="购买金额" prop="buyAmount">
              <el-input-number v-model="form.buyAmount" controls-position="right" :min="0" :readOnly="allBuyFlg==true" :disabled="allBuyFlg==true"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="支付方式" prop="buyType">
              <el-select v-model="form.buyType" placeholder="支付方式">
                <el-option
                  v-for="item in buyTypeOptions"
                  :key="item.dictValue"
                  :label="item.dictLabel"
                  :value="item.dictValue"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加卖币对话框 -->
    <el-dialog :title="title" :visible.sync="addSaleOpen" width="1200px" append-to-body>
      <el-form ref="addForm" :model="addForm" :rules="addRules" label-width="180px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="支持支付类型" prop="supportBuyTypeArg">
              <el-select v-model="addForm.supportBuyTypeArg" multiple placeholder="请选择支付类型">
                <el-option
                  v-for="item in buyTypeOptions"
                  :key="item.dictValue"
                  :label="item.dictLabel"
                  :value="item.dictValue"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="是否可拆分" prop="saleSplitType">
              <el-select v-model="addForm.saleSplitType">
                <el-option
                  v-for="dict in dict.type.sale_split_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="加急销售" prop="urgentSaleFlg">
              <el-select v-model="addForm.urgentSaleFlg">
                <el-option
                  v-for="dict in dict.type.urgent_sale_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="售出金额" prop="saleAmount">
              <el-input-number v-model="addForm.saleAmount" controls-position="right" :min="0"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitAddSaleForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listShopping,
  getShoppingDetail,
  buyShoppingCoin,
  saleShoppingCoin,
  selectSaleUser
} from "@/api/system/saleCoin";
import Treeselect from "@riophae/vue-treeselect";
import {delUser} from "@/api/system/user";

export default {
  name: "SaleCoin",
  components: {Treeselect},
  dicts: ['sale_split_type','pay_type','urgent_sale_status','sale_status'],
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
      // 卖币表格数据
      saleCoinList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示新增弹出层
      addSaleOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        startSaleTime: null,
        endSaleTime: null,
        saleNo: null,
        saleUserId: null,
        saleSplitType: null,
        supportBuyTypeName: null,
        supportBuyType: null,
        urgentSaleFlg: null,
        status: '1',
      },
      // 表单参数
      form: {},
      // 新增表单参数
      addForm: {},
      // 角色选项
      buyTypeOptions: [],
      userListOptions:[],
      allBuyFlg:false,
      supportWechatPayFlg:false,
      supportAlipayFlg:false,
      supportUnionPayFlg:false,
      // 表单校验
      rules: {
        buyAmount: [
          { required: true, message: "购买金额不能为空", trigger: "blur" }
        ],
        buyType: [
          { required: true, message: "支付方式不能为空", trigger: "blur" }
        ],
      },
      // 新增表单校验
      addRules: {
        saleAmount: [
          { required: true, message: "卖币金额不能为空", trigger: "blur" },
          {
            validator: (rule, value, callBack) => {
              if(value > 0){
                callBack()
              }else{
                callBack('金额必须大于0')
              }
            }
          }
        ],
        saleSplitType: [
          { required: true, message: "拆分类型不能为空", trigger: "blur" }
        ],
        urgentSaleFlg: [
          { required: true, message: "紧急状态不能为空", trigger: "blur" }
        ],
        supportBuyTypeArg: [
          { required: true, message: "支持的支付方式不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getUserList();
  },
  methods: {
    /** 查询卖币列表 */
    getList() {
      this.loading = true;
      listShopping(this.queryParams).then(response => {
        this.saleCoinList = response.rows;
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
      this.addSaleOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        saleId: null,
        saleNo: null,
        saleTime: null,
        saleUserNickName: null,
        remainAmount: null,
        saleSplitType: null,
        supportBuyType: null,
        supportBuyTypeArg: [],
        wechatPayImg: null,
        alipayImg: null,
        unionpayAccount: null,
        unionpayCard: null,
        saleAmount: null,
        urgentSaleFlg: null,
        buyAmount: 0,
        buyType: null,
      };
      this.addForm = {
        saleAmount: null,
        saleSplitType: '0',
        supportBuyType: null,
        supportBuyTypeArg: [],
        urgentSaleFlg: '0',
      };

      this.resetForm("form");
      this.resetForm("addForm");
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
      this.ids = selection.map(item => item.saleId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      getShoppingDetail(0).then(response => {
        this.addSaleOpen = true;
        this.title = "添加卖币";
        this.buyTypeOptions = response.payTypes;
      });
    },
    /** 购买按钮操作 */
    handleBuy(row) {
      this.reset();
      const saleId = row.saleId || this.ids
      getShoppingDetail(saleId).then(response => {
        this.form = response.data;
        this.buyTypeOptions = response.payTypes;
        // if(this.form.saleUserId === this.$store.state.user.id){
        if(this.form.supportBuyType.indexOf("0") != -1){
          this.supportWechatPayFlg = true;
        }else{
          this.supportWechatPayFlg = false;
        }
        if(this.form.supportBuyType.indexOf("1") != -1){
          this.supportAlipayFlg = true;
        }else{
          this.supportAlipayFlg = false;
        }
        if(this.form.supportBuyType.indexOf("2") != -1){
          this.supportUnionPayFlg = true;
        }else{
          this.supportUnionPayFlg = false;
        }

        if(this.form.saleSplitType === "0"){
          this.form.buyAmount = this.form.remainAmount;
          this.allBuyFlg = true;
        }else{
          this.form.buyAmount = 0.01;
          this.allBuyFlg = false;
        }
        this.open = true;
        this.title = "购买";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.saleId != null) {
            // buyShoppingCoin({"saleId":this.form.saleId,"buyAmount":this.form.buyAmount,"buyType":this.form.buyType}).then(response => {
            //   this.$modal.msgSuccess("购买成功");
            //   this.open = false;
            //   this.getList();
            // });
            var data = {"saleId":this.form.saleId,"buyAmount":this.form.buyAmount,"buyType":this.form.buyType};
            this.$modal.confirm('确认购买，并完成打款?').then(function() {
              return buyShoppingCoin(data);
            }).then(() => {
              this.$modal.msgSuccess("购买成功");
              this.open = false;
              this.getList();
            }).catch((e) => {
            });
          }
        }
      });
    },
    submitAddSaleForm(){
      this.$refs["addForm"].validate(valid => {
        if (valid) {
          saleShoppingCoin(this.addForm).then(response => {
            this.$modal.msgSuccess("卖币成功");
            this.addSaleOpen = false;
            this.getList();
          });
        }
      });
    }
  }
};
</script>
