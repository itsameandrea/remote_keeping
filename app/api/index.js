import axios from 'axios'
import jan from 'json-api-normalizer'

export const normalize = (json) => {
  let normalizedJson = jan(json)
  return normalizedJson[Object.keys(normalizedJson)[0]]
}

const api = axios.create({
  baseURL: 'http://localhost:3000/api/v1',
})

api.interceptors.request.use(
  (config) => {
    // add authorization header with JWT authentication token
    config.headers.authorization = `Bearer ${localStorage.getItem('auth._token.local')}`
    return config
  },
  error => Promise.reject(error)
)

// api.interceptors.response.use((response) => {
//   if (response.data.jwt)
//     localStorage.setItem('auth._token.local', response.data.jwt)
//   return response;
// }, function (error) {
//   // Do something with response error
//   return Promise.reject(error);
// })

export default api;
