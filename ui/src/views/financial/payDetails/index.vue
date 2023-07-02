<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="85px">
      <el-form-item label="教职工编号" prop="facultyId">
        <el-input v-model="queryParams.facultyId" placeholder="请输入教职工编号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="姓名" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入姓名" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="月份" prop="month">
        <el-input v-model="queryParams.month" placeholder="请输入月份" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="基本工资" prop="basicPay">
        <el-input v-model="queryParams.basicPay" placeholder="请输入基本工资" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="职务" prop="job">
        <el-select v-model="queryParams.job" placeholder="请选择职务" clearable>
          <el-option v-for="dict in faculty_job" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="职称" prop="title">
        <el-select v-model="queryParams.title" placeholder="请选择职称" clearable>
          <el-option v-for="dict in faculty_title" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="生活补贴" prop="livingSubsidy">
        <el-input v-model="queryParams.livingSubsidy" placeholder="请输入生活补贴" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="书报费" prop="readingSubsidy">
        <el-input v-model="queryParams.readingSubsidy" placeholder="请输入书报费" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="交通费" prop="transportationSubsidy">
        <el-input v-model="queryParams.transportationSubsidy" placeholder="请输入交通费" clearable
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="洗理费" prop="washingSubsidy">
        <el-input v-model="queryParams.washingSubsidy" placeholder="请输入洗理费" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="课时费" prop="teacherPay">
        <el-input v-model="queryParams.teacherPay" placeholder="请输入课时费" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="岗位津贴" prop="staffPay">
        <el-input v-model="queryParams.staffPay" placeholder="请输入岗位津贴" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="超额课时费" prop="extraTeacherPay">
        <el-input v-model="queryParams.extraTeacherPay" placeholder="请输入超额课时费" clearable
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="工资总额" prop="totalPay">
        <el-input v-model="queryParams.totalPay" placeholder="请输入工资总额" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="个人所得税" prop="tax">
        <el-input v-model="queryParams.tax" placeholder="请输入个人所得税" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="住房公积金" prop="housing">
        <el-input v-model="queryParams.housing" placeholder="请输入住房公积金" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="保险费" prop="insurance">
        <el-input v-model="queryParams.insurance" placeholder="请输入保险费" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="实发工资" prop="netPay">
        <el-input v-model="queryParams.netPay" placeholder="请输入实发工资" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['financial:payDetails:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['financial:payDetails:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['financial:payDetails:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['financial:payDetails:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="payDetailsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="教职工编号" width="85" align="center" prop="facultyId" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="月份" align="center" prop="month" />
      <el-table-column label="基本工资" align="center" prop="basicPay" />
      <el-table-column label="职务" align="center" prop="job">
        <template slot-scope="scope">
          {{ facultyJobFormat(scope.row.job) }}
        </template>
      </el-table-column>
      <el-table-column label="职称" align="center" prop="title">
        <template slot-scope="scope">
          {{ facultyTitleFormat(scope.row.title) }}
        </template>
      </el-table-column>
      <el-table-column label="生活补贴" align="center" prop="livingSubsidy" />
      <el-table-column label="书报费" align="center" prop="readingSubsidy" />
      <el-table-column label="交通费" align="center" prop="transportationSubsidy" />
      <el-table-column label="洗理费" align="center" prop="washingSubsidy" />
      <el-table-column label="课时费" align="center" prop="teacherPay" />
      <el-table-column label="岗位津贴" align="center" prop="staffPay" />
      <el-table-column label="超额课时费" width="85" align="center" prop="extraTeacherPay" />
      <el-table-column label="工资总额" align="center" prop="totalPay" />
      <el-table-column label="个人所得税" width="85" align="center" prop="tax" />
      <el-table-column label="住房公积金" width="85" align="center" prop="housing" />
      <el-table-column label="保险费" align="center" prop="insurance" />
      <el-table-column label="实发工资" align="center" prop="netPay" />
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

  </div>
</template>

<script>
import { listPayDetails, getPayDetails, delPayDetails, addPayDetails, updatePayDetails } from "@/api/financial/payDetails";

export default {
  name: "PayDetails",
  dicts: [],
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
      // 全部工资明细表表格数据
      payDetailsList: [],
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
        month: null,
        basicPay: null,
        job: null,
        title: null,
        livingSubsidy: null,
        readingSubsidy: null,
        transportationSubsidy: null,
        washingSubsidy: null,
        teacherPay: null,
        staffPay: null,
        extraTeacherPay: null,
        totalPay: null,
        tax: null,
        housing: null,
        insurance: null,
        netPay: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      // 职务
      faculty_job:[
        { label: "校长", value: 1 },
        { label: "副校长", value: 2 },
        { label: "处长", value: 3 },
        { label: "副处长", value: 4 },
        { label: "科长", value: 5 },
        { label: "副科长", value: 6 },
        { label: "主管", value: 7 },
        { label: "职员", value: 8 },
        { label: "无", value: 0 }
      ],
      // 职称
      faculty_title: [
        { label: "教授", value: 1 },
        { label: "副教授", value: 2 },
        { label: "讲师", value: 3 },
        { label: "助教", value: 4 },
        { label: "无", value: 0 }
      ],
    };
  },
  created() {
    this.getList();
  },
  methods: {
    // 自定义方法翻译
    facultyJobFormat(job) {
      return this.selectDictLabel(this.faculty_job, job);
    },
    facultyTitleFormat(title) {
      return this.selectDictLabel(this.faculty_title, title);
    },
    /** 查询全部工资明细表列表 */
    getList() {
      this.loading = true;
      listPayDetails(this.queryParams).then(response => {
        this.payDetailsList = response.rows;
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
        month: null,
        basicPay: null,
        job: null,
        title: null,
        livingSubsidy: null,
        readingSubsidy: null,
        transportationSubsidy: null,
        washingSubsidy: null,
        teacherPay: null,
        staffPay: null,
        extraTeacherPay: null,
        totalPay: null,
        tax: null,
        housing: null,
        insurance: null,
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
      this.title = "添加全部工资明细表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const facultyId = row.facultyId || this.ids
      getPayDetails(facultyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改全部工资明细表";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.facultyId != null) {
            updatePayDetails(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPayDetails(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除全部工资明细表编号为"' + facultyIds + '"的数据项？').then(function () {
        return delPayDetails(facultyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('financial/payDetails/export', {
        ...this.queryParams
      }, `payDetails_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
