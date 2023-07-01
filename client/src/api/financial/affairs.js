import request from '@/utils/request'

// 查询事务列表
export function listAffairs(query) {
  return request({
    url: '/financial/affairs/list',
    method: 'get',
    params: query
  })
}

// 查询事务详细
export function getAffairs(id) {
  return request({
    url: '/financial/affairs/' + id,
    method: 'get'
  })
}

// 新增事务
export function addAffairs(data) {
  return request({
    url: '/financial/affairs',
    method: 'post',
    data: data
  })
}

// 修改事务
export function updateAffairs(data) {
  return request({
    url: '/financial/affairs',
    method: 'put',
    data: data
  })
}

// 删除事务
export function delAffairs(id) {
  return request({
    url: '/financial/affairs/' + id,
    method: 'delete'
  })
}
