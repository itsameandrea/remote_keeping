import { UPDATE_RECORD } from '@/store/lib/actions'
import { FETCH_RECORD } from './lib/actions';

const API_ENDPOINT = '/employers'
const MODULE = 'employers'

export const state = () => ({
  employer: null
})

export const getters = {
  employer: (state) => state.employer
}

export const mutations = {
  
}

export const actions = {
  FETCH_EMPLOYER: FETCH_RECORD({
    endpoint: API_ENDPOINT,
    module: MODULE,
    attr: 'employer'
  }),
  UPDATE_EMPLOYER: UPDATE_RECORD({ 
    endpoint: API_ENDPOINT,
    module: MODULE,
    attr: 'employer'
  }),
}