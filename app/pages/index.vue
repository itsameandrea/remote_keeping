<template>
  <div class="container px-6">
    <calendar
      @ctaClick="createShift = true"
      @datesChanged="fetchDays"/>
  </div>
</template>

<script>
import Calendar from '@/components/Calendar'

export default {
  middleware: 'auth',
  components: {
    Calendar
  },
  computed: {
    user () {
      return this.$auth.user
    },
    firstLogin () {
      return localStorage.getItem('firstLogin')
    }
  },
  async mounted () {
    if (this.firstLogin && this.user.attributes.login_count === 1) {
      this.$router.push('/profile?initial=true')
    }
  },
  methods: {
    fetchDays (dates) {
      this.$store.dispatch('days/FETCH_DAYS', dates)
    }
  }
}
</script>

<style>
</style>
