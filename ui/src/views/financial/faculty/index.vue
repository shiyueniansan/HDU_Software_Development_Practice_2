<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="75px">
      <el-form-item label="姓名" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入姓名" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="教师/职工" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择教师/职工" clearable>
          <el-option v-for="dict in faculty_type" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
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
      <el-form-item label="基本工资" prop="basicPay">
        <el-input v-model="queryParams.basicPay" placeholder="请输入基本工资" clearable @keyup.enter.native="handleQuery" />
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
      <el-form-item label="定额课时" prop="quotaHour">
        <el-input v-model="queryParams.quotaHour" placeholder="请输入定额课时" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['financial:faculty:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['financial:faculty:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['financial:faculty:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['financial:faculty:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="facultyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="教师/职工" align="center" prop="type">
        <template slot-scope="scope">
          {{ facultyTypeFormat(scope.row.type) }}
        </template>
      </el-table-column>
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
      <el-table-column label="基本工资" align="center" prop="basicPay" />
      <el-table-column label="生活补贴" align="center" prop="livingSubsidy" />
      <el-table-column label="书报费" align="center" prop="readingSubsidy" />
      <el-table-column label="交通费" align="center" prop="transportationSubsidy" />
      <el-table-column label="洗理费" align="center" prop="washingSubsidy" />
      <el-table-column label="定额课时" align="center" prop="quotaHour" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['financial:faculty:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['financial:faculty:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改教职工对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="教师/职工" prop="type">
          <el-select v-model="form.type" placeholder="请选择教师/职工">
            <el-option v-for="dict in faculty_type" :key="dict.value" :label="dict.label"
              :value="parseInt(dict.value)"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="职务" prop="job">
          <el-select v-model="form.job" placeholder="请选择职务">
            <el-option v-for="dict in faculty_job" :key="dict.value" :label="dict.label"
              :value="parseInt(dict.value)"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="职称" prop="title">
          <el-select v-model="form.title" placeholder="请选择职称">
            <el-option v-for="dict in faculty_title" :key="dict.value" :label="dict.label"
              :value="parseInt(dict.value)"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="基本工资" prop="basicPay">
          <el-input v-model="form.basicPay" placeholder="请输入基本工资" />
        </el-form-item>
        <el-form-item label="生活补贴" prop="livingSubsidy">
          <el-input v-model="form.livingSubsidy" placeholder="请输入生活补贴" />
        </el-form-item>
        <el-form-item label="书报费" prop="readingSubsidy">
          <el-input v-model="form.readingSubsidy" placeholder="请输入书报费" />
        </el-form-item>
        <el-form-item label="交通费" prop="transportationSubsidy">
          <el-input v-model="form.transportationSubsidy" placeholder="请输入交通费" />
        </el-form-item>
        <el-form-item label="洗理费" prop="washingSubsidy">
          <el-input v-model="form.washingSubsidy" placeholder="请输入洗理费" />
        </el-form-item>
        <el-form-item label="定额课时" prop="quotaHour">
          <el-input v-model="form.quotaHour" placeholder="请输入定额课时" />
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
import { listFaculty, getFaculty, delFaculty, addFaculty, updateFaculty } from "@/api/financial/faculty";

export default {
  name: "Faculty",
  // dicts: ['faculty_title', 'faculty_job', 'faculty_type'],
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
      // 教职工表格数据
      facultyList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        type: null,
        title: null,
        job: null,
        basicPay: null,
        livingSubsidy: null,
        readingSubsidy: null,
        transportationSubsidy: null,
        washingSubsidy: null,
        quotaHour: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "姓名不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "教师/职工不能为空", trigger: "change" }
        ],
      },
      // 教师/职工
      faculty_type: [
        { label: "教师", value: 0 },
        { label: "职工", value: 1 }
      ],
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
    facultyTypeFormat(type) {
      return this.selectDictLabel(this.faculty_type, type);
    },
    facultyJobFormat(job) {
      return this.selectDictLabel(this.faculty_job, job);
    },
    facultyTitleFormat(title) {
      return this.selectDictLabel(this.faculty_title, title);
    },
    /** 查询教职工列表 */
    getList() {
      this.loading = true;
      listFaculty(this.queryParams).then(response => {
        this.facultyList = response.rows;
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
        id: null,
        name: null,
        type: null,
        title: null,
        job: null,
        basicPay: null,
        livingSubsidy: null,
        readingSubsidy: null,
        transportationSubsidy: null,
        washingSubsidy: null,
        quotaHour: null
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加教职工";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getFaculty(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改教职工";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFaculty(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFaculty(this.form).then(response => {
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
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除教职工编号为"' + ids + '"的数据项？').then(function () {
        return delFaculty(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('financial/faculty/export', {
        ...this.queryParams
      }, `faculty_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
