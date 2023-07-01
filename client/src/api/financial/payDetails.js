import request from '@/utils/request'

// 查询全部工资明细表列表
export function listPayDetails(query) {
  return request({
    url: '/financial/payDetails/list',
    method: 'get',
    params: query
  })
}

// 查询全部工资明细表详细
export function getPayDetails(facultyId) {
  return request({
    url: '/financial/payDetails/' + facultyId,
    method: 'get'
  })
}

// 新增全部工资明细表
export function addPayDetails(data) {
  return request({
    url: '/financial/payDetails',
    method: 'post',
    data: data
  })
}

// 修改全部工资明细表
export function updatePayDetails(data) {
  return request({
    url: '/financial/payDetails',
    method: 'put',
    data: data
  })
}

// 删除全部工资明细表
export function delPayDetails(facultyId) {
  return request({
    url: '/financial/payDetails/' + facultyId,
    method: 'delete'
  })
}
