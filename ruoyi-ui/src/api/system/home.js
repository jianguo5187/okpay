import request from '@/utils/request'

export function selectHomePageData(query) {
  return request({
    url: '/system/app/getHomePageData',
    method: 'get',
    params: query
  })
}
