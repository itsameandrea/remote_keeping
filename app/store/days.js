import { FETCH_RECORDS } from '@/store/lib/actions'

const API_ENDPOINT = '/days'
const MODULE = 'days'

export const state = () => ({
  days: null
})

export const getters = {
  days: (state) => state.days
}

export const mutations = {

}

export const actions = {
  FETCH_DAYS: FETCH_RECORDS({
    endpoint: API_ENDPOINT,
    module: MODULE,
    attr: 'days'
  })
}
