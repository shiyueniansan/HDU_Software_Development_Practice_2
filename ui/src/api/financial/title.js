import request from '@/utils/request'

// 查询职称列表
export function listTitle(query) {
  return request({
    url: '/financial/title/list',
    method: 'get',
    params: query
  })
}

// 查询职称详细
export function getTitle(id) {
  return request({
    url: '/financial/title/' + id,
    method: 'get'
  })
}

// 新增职称
export function addTitle(data) {
  return request({
    url: '/financial/title',
    method: 'post',
    data: data
  })
}

// 修改职称
export function updateTitle(data) {
  return request({
    url: '/financial/title',
    method: 'put',
    data: data
  })
}

// 删除职称
export function delTitle(id) {
  return request({
    url: '/financial/title/' + id,
    method: 'delete'
  })
}
