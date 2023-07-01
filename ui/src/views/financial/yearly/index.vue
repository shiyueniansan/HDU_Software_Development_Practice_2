<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="140px">
      <el-form-item label="教职工编号" prop="facultyId">
        <el-input v-model="queryParams.facultyId" placeholder="请输入教职工编号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="姓名" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入姓名" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="本年度累计工资总额" prop="totalPay">
        <el-input v-model="queryParams.totalPay" placeholder="请输入本年度累计工资总额" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="本年度累计授课时数" prop="hour">
        <el-input v-model="queryParams.hour" placeholder="请输入本年度累计授课时数" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="上年度月平均工资" prop="avgPay">
        <el-input v-model="queryParams.avgPay" placeholder="请输入上年度月平均工资" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="本年度累计实发工资" prop="netPay">
        <el-input v-model="queryParams.netPay" placeholder="请输入本年度累计实发工资" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['financial:yearly:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['financial:yearly:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['financial:yearly:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['financial:yearly:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="yearlyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="教职工编号" align="center" prop="facultyId" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="本年度累计工资总额" align="center" prop="totalPay" />
      <el-table-column label="本年度累计授课时数" align="center" prop="hour" />
      <el-table-column label="上年度月平均工资" align="center" prop="avgPay" />
      <el-table-column label="本年度累计实发工资" align="center" prop="netPay" />
      <!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['financial:yearly:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['financial:yearly:remove']"
          >删除</el-button>
        </template>
      </el-table-column>-->
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!--    &lt;!&ndash; 添加或修改教职工年度对话框 &ndash;&gt;
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>-->
  </div>
</template>

<script>
import { listYearly, getYearly, delYearly, addYearly, updateYearly } from "@/api/financial/yearly";

export default {
  name: "Yearly",
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
      // 教职工年度表格数据
      yearlyList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        facultyId: null,
        name: null,
        totalPay: null,
        hour: null,
        avgPay: null,
        netPay: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询教职工年度列表 */
    getList() {
      this.loading = true;
      listYearly(this.queryParams).then(response => {
        this.yearlyList = response.rows;
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
        facultyId: null,
        name: null,
        totalPay: null,
        hour: null,
        avgPay: null,
        netPay: null
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
      this.ids = selection.map(item => item.facultyId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加教职工年度";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const facultyId = row.facultyId || this.ids
      getYearly(facultyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改教职工年度";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.facultyId != null) {
            updateYearly(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addYearly(this.form).then(response => {
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
      const facultyIds = row.facultyId || this.ids;
      this.$modal.confirm('是否确认删除教职工年度编号为"' + facultyIds + '"的数据项？').then(function () {
        return delYearly(facultyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('financial/yearly/export', {
        ...this.queryParams
      }, `yearly_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
