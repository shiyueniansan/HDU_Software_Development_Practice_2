import request from '@/utils/request'

// 查询工资明细表列表
export function listPayDetail(query) {
  return request({
    url: '/financial/payDetail/list',
    method: 'get',
    params: query
  })
}

// 查询工资明细表详细
export function getPayDetail(facultyId) {
  return request({
    url: '/financial/payDetail/' + facultyId,
    method: 'get'
  })
}

// 新增工资明细表
export function addPayDetail(data) {
  return request({
    url: '/financial/payDetail',
    method: 'post',
    data: data
  })
}

// 修改工资明细表
export function updatePayDetail(data) {
  return request({
    url: '/financial/payDetail',
    method: 'put',
    data: data
  })
}

// 删除工资明细表
export function delPayDetail(facultyId) {
  return request({
    url: '/financial/payDetail/' + facultyId,
    method: 'delete'
  })
}
