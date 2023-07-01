import request from '@/utils/request'

// 查询工资表列表
export function listPay(query) {
  return request({
    url: '/financial/pay/list',
    method: 'get',
    params: query
  })
}

// 查询工资表详细
export function getPay(facultyId) {
  return request({
    url: '/financial/pay/' + facultyId,
    method: 'get'
  })
}

// 新增工资表
export function addPay(data) {
  return request({
    url: '/financial/pay',
    method: 'post',
    data: data
  })
}

// 修改工资表
export function updatePay(data) {
  return request({
    url: '/financial/pay',
    method: 'put',
    data: data
  })
}

// 删除工资表
export function delPay(facultyId) {
  return request({
    url: '/financial/pay/' + facultyId,
    method: 'delete'
  })
}
