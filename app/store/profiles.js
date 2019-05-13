import { UPDATE_RECORD } from '@/store/lib/actions'
import { FETCH_RECORD } from './lib/actions';

const API_ENDPOINT = '/profiles'
const MODULE = 'profiles'

export const state = () => ({
  profile: null
})

export const getters = {
  profile: (state) => state.profile
}

export const mutations = {
  
}

export const actions = {
  FETCH_PROFILE: FETCH_RECORD({
    endpoint: API_ENDPOINT,
    module: MODULE,
    attr: 'profile'
  }),
  UPDATE_PROFILE: UPDATE_RECORD({ 
    endpoint: API_ENDPOINT,
    module: MODULE,
    attr: 'profile'
  }),
}