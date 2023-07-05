<template>
  <div class="dashboard-editor-container">
    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;">
      <line-chart :chart-data="lineChartData" />
    </el-row>
  </div>
</template>

<script>
import LineChart from './dashboard/LineChart'

const lineChartData = {
  newVisitis: {
    expectedData: [100, 120, 110, 134, 105, 90, 110],
    actualData: [120, 55, 91, 154, 133, 140, 120]
  },
}

export default {
  name: 'Index',
  components: {
    LineChart,
  },
  data() {
    return {
      lineChartData: lineChartData.newVisitis
    }
  },
}
</script>

<style lang="scss" scoped>
.dashboard-editor-container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;

  //.chart-wrapper {
  //  background: #fff;
  //  padding: 16px 16px 0;
  //  margin-bottom: 32px;
  //}
}

@media (max-width:1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}
</style>
