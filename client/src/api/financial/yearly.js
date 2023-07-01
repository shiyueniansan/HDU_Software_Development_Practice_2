import request from '@/utils/request'

// 查询教职工年度列表
export function listYearly(query) {
  return request({
    url: '/financial/yearly/list',
    method: 'get',
    params: query
  })
}

// 查询教职工年度详细
export function getYearly(facultyId) {
  return request({
    url: '/financial/yearly/' + facultyId,
    method: 'get'
  })
}

// 新增教职工年度
export function addYearly(data) {
  return request({
    url: '/financial/yearly',
    method: 'post',
    data: data
  })
}

// 修改教职工年度
export function updateYearly(data) {
  return request({
    url: '/financial/yearly',
    method: 'put',
    data: data
  })
}

// 删除教职工年度
export function delYearly(facultyId) {
  return request({
    url: '/financial/yearly/' + facultyId,
    method: 'delete'
  })
}
