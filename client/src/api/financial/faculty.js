import request from '@/utils/request'

// 查询教职工列表
export function listFaculty(query) {
  return request({
    url: '/financial/faculty/list',
    method: 'get',
    params: query
  })
}

// 查询教职工详细
export function getFaculty(id) {
  return request({
    url: '/financial/faculty/' + id,
    method: 'get'
  })
}

// 新增教职工
export function addFaculty(data) {
  return request({
    url: '/financial/faculty',
    method: 'post',
    data: data
  })
}

// 修改教职工
export function updateFaculty(data) {
  return request({
    url: '/financial/faculty',
    method: 'put',
    data: data
  })
}

// 删除教职工
export function delFaculty(id) {
  return request({
    url: '/financial/faculty/' + id,
    method: 'delete'
  })
}
