import request from '@/utils/request'

// 查询交易记录列表
export function listTransactionRecord(query) {
  return request({
    url: '/system/transactionRecord/list',
    method: 'get',
    params: query
  })
}

// 查询交易记录详细
export function getTransactionRecord(recordId) {
  return request({
    url: '/system/transactionRecord/' + recordId,
    method: 'get'
  })
}

// 新增交易记录
export function addTransactionRecord(data) {
  return request({
    url: '/system/transactionRecord',
    method: 'post',
    data: data
  })
}

// 修改交易记录
export function updateTransactionRecord(data) {
  return request({
    url: '/system/transactionRecord',
    method: 'put',
    data: data
  })
}

// 删除交易记录
export function delTransactionRecord(recordId) {
  return request({
    url: '/system/transactionRecord/' + recordId,
    method: 'delete'
  })
}

// 查询用户交易合计记录列表
export function userTransactionRecord(query) {
  return request({
    url: '/system/transactionRecord/userTransactionlist',
    method: 'get',
    params: query
  })
}
// 查询用户交易合计金额
export function getUserTotalAmount(query) {
  return request({
    url: '/system/transactionRecord/getUserTotalAmount',
    method: 'get',
    params: query
  })
}

// 查询交易记录列表
export function listUserTransactionMoney(query) {
  return request({
    url: '/system/transactionRecord/listUserTransactionMoney',
    method: 'get',
    params: query
  })
}
