import request from '@/utils/request'

// 查询个人事务列表
export function listAffair(query) {
  return request({
    url: '/financial/affair/list',
    method: 'get',
    params: query
  })
}

// 查询个人事务详细
export function getAffair(id) {
  return request({
    url: '/financial/affair/' + id,
    method: 'get'
  })
}

// 新增个人事务
export function addAffair(data) {
  return request({
    url: '/financial/affair',
    method: 'post',
    data: data
  })
}

// 修改个人事务
export function updateAffair(data) {
  return request({
    url: '/financial/affair',
    method: 'put',
    data: data
  })
}

// 删除个人事务
export function delAffair(id) {
  return request({
    url: '/financial/affair/' + id,
    method: 'delete'
  })
}
