import request from '@/utils/request'

// 查询职务列表
export function listJob(query) {
  return request({
    url: '/financial/job/list',
    method: 'get',
    params: query
  })
}

// 查询职务详细
export function getJob(id) {
  return request({
    url: '/financial/job/' + id,
    method: 'get'
  })
}

// 新增职务
export function addJob(data) {
  return request({
    url: '/financial/job',
    method: 'post',
    data: data
  })
}

// 修改职务
export function updateJob(data) {
  return request({
    url: '/financial/job',
    method: 'put',
    data: data
  })
}

// 删除职务
export function delJob(id) {
  return request({
    url: '/financial/job/' + id,
    method: 'delete'
  })
}
