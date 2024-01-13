import request from '@/utils/request'

// 查询买币列表
export function listBuyCoin(query) {
  return request({
    url: '/system/buyCoin/list',
    method: 'get',
    params: query
  })
}

// 查询买币详细
export function getBuyCoin(buyId) {
  return request({
    url: '/system/buyCoin/' + buyId,
    method: 'get'
  })
}

// 新增买币
export function addBuyCoin(data) {
  return request({
    url: '/system/buyCoin',
    method: 'post',
    data: data
  })
}

// 修改买币
export function updateBuyCoin(data) {
  return request({
    url: '/system/buyCoin',
    method: 'put',
    data: data
  })
}

// 删除买币
export function delBuyCoin(buyId) {
  return request({
    url: '/system/buyCoin/' + buyId,
    method: 'delete'
  })
}
