import { CREATE_RECORD } from '@/store/lib/actions'
import { loadRelationships } from '@/store/lib'
import api from '@/api'

const API_ENDPOINT = '/users'

const MODULE = 'users'

const SCHEMA = {
  relationships: [
    {
      name: 'business',
      action: 'businesses/FETCH_BUSINESS'
    },
    {
      name: 'employer',
      action: 'employers/FETCH_EMPLOYER'
    },
    {
      name: 'profile',
      action: 'profiles/FETCH_PROFILE'
    }
  ]
}

export const state = () => ({
  user: null
})

export const getters = {

}

export const mutations = {

}

export const actions = {
  async CREATE_USER ({ dispatch }, payload) {
    const { data } = await api.post(API_ENDPOINT, payload)
    localStorage.setItem('firstLogin', true)
    this.$auth.setToken('local', data.jwt)

    await this.$auth.fetchUser()

    const user = this.$auth.user

    loadRelationships(dispatch, user, SCHEMA)
  },
  async LOAD_RELATIONSHIPS ({ dispatch }) {
    loadRelationships(dispatch, this.$auth.user, SCHEMA)
  }
}
