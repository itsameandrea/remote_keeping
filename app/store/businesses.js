import { UPDATE_RECORD } from '@/store/lib/actions'
import { FETCH_RECORD } from './lib/actions';

const API_ENDPOINT = '/businesses'
const MODULE = 'businesses'

export const state = () => ({
  business: null
})

export const getters = {
  business: (state) => state.business
}

export const mutations = {
  
}

export const actions = {
  FETCH_BUSINESS: FETCH_RECORD({
    endpoint: API_ENDPOINT,
    module: MODULE,
    attr: 'business'
  }),
  UPDATE_BUSINESS: UPDATE_RECORD({ 
    endpoint: API_ENDPOINT,
    module: MODULE,
    attr: 'business'
  }),
}