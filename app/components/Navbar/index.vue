<template>
  <nav class="bg-red w-screen h-12 shadow-md flex items-center justify-between mb-10">
    <div class="ml-5">
      Toorno
    </div>
    <div class="mr-5 h-full flex justify-between">
      <nav-link
        v-for="link in links"
        :key="link.text"
        :to="link.isUrl ? link.to : null"
        @click="!link.isUrl ? link.onClick : null">
        {{ link.text }}
      </nav-link>
      <nav-link @click="onLogout">
        Logout
      </nav-link>
    </div>
  </nav>
</template>

<script>
import NavLink from './NavLink'
export default {
  components: {
    NavLink
  },
  computed: {
    links () {
      return [
        {
          text: 'Calendar',
          isUrl: true,
          to: '/'
        },
        {
          text: 'Vacations',
          isUrl: true,
          to: '/vacations'
        },
        {
          text: 'Profile',
          isUrl: true,
          to: '/profile'
        }
      ]
    }
  },
  methods: {
    async onLogout () {
      await this.$auth.logout()
    }
  }
}
</script>

<style>

</style>
