import request from '@/utils/request'

// 查询用户支付方式审核列表
export function listPayApprove(query) {
  return request({
    url: '/system/payApprove/list',
    method: 'get',
    params: query
  })
}

// 查询用户支付方式审核详细
export function getPayApprove(payTypeApproveId) {
  return request({
    url: '/system/payApprove/' + payTypeApproveId,
    method: 'get'
  })
}

// 新增用户支付方式审核
export function addPayApprove(data) {
  return request({
    url: '/system/payApprove',
    method: 'post',
    data: data
  })
}

// 修改用户支付方式审核
export function updatePayApprove(data) {
  return request({
    url: '/system/payApprove',
    method: 'put',
    data: data
  })
}

// 删除用户支付方式审核
export function delPayApprove(payTypeApproveId) {
  return request({
    url: '/system/payApprove/' + payTypeApproveId,
    method: 'delete'
  })
}

// 更新支付方式状态
export function updatePayType(data) {
  return request({
    url: '/system/app/updatePayTypeStatus',
    method: 'post',
    data: data
  })
}
