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

// 查询买币列表
export function listShoppingBuyCoin(query) {
  return request({
    url: '/system/buyCoin/shoppingBuyList',
    method: 'get',
    params: query
  })
}

// 确认打款
export function confirmPayment(data) {
  return request({
    url: '/system/app/updateBuyStatus',
    method: 'post',
    data: data
  })
}
