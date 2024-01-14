import request from '@/utils/request'

// 查询卖币列表
export function listSaleCoin(query) {
  return request({
    url: '/system/saleCoin/list',
    method: 'get',
    params: query
  })
}

// 查询卖币详细
export function getSaleCoin(saleId) {
  return request({
    url: '/system/saleCoin/' + saleId,
    method: 'get'
  })
}

// 新增卖币
export function addSaleCoin(data) {
  return request({
    url: '/system/saleCoin',
    method: 'post',
    data: data
  })
}

// 修改卖币
export function updateSaleCoin(data) {
  return request({
    url: '/system/saleCoin',
    method: 'put',
    data: data
  })
}

// 删除卖币
export function delSaleCoin(saleId) {
  return request({
    url: '/system/saleCoin/' + saleId,
    method: 'delete'
  })
}
