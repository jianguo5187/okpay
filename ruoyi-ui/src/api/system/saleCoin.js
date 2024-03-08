import request from '@/utils/request'
import {parseStrEmpty} from "@/utils/ruoyi";

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

// 查询交易市场列表
export function listShopping(query) {
  return request({
    url: '/system/saleCoin/shoppingList',
    method: 'get',
    params: query
  })
}

// 查询交易详细
export function getShoppingDetail(saleId) {
  return request({
    url: '/system/saleCoin/shopping/' + saleId,
    method: 'get'
  })
}

// 购买
export function buyShoppingCoin(data) {
  return request({
    url: '/system/saleCoin/shoppingCoinBuy',
    method: 'post',
    data: data
  })
}

// 卖币
export function saleShoppingCoin(data) {
  return request({
    url: '/system/saleCoin/saleShoppingCoin',
    method: 'post',
    data: data
  })
}

// 用户列表
export function selectSaleUser() {
  return request({
    url: '/system/app/getAllUserList',
    method: 'get',
  })
}
