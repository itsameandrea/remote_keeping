<template>
  <div class="container px-6">
    <calendar
      @selected="onShiftSelected"
      @ctaClick="createShift = true"/>
    <!-- <floating-button icon="fas fa-plus" @click="createShift = true"/> -->
    <shift-modal
      :showModal="createShift"
      :preloadShift="selectedShift"
      @close="createShift = false"
      @submit="onAdd" />
  </div>
</template>

<script>
import Calendar from '@/components/Calendar'
import FloatingButton from '@/components/FloatingButton'
import ShiftModal from '@/components/ShiftModal'

export default {
  middleware: 'auth',
  components: {
    Calendar,
    FloatingButton,
    ShiftModal
  },
  data () {
    return {
      createShift: false,
      selectedShift: null,
    }
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
    async onAdd (shift) {
      await this.$store.dispatch('shifts/create', shift)
      this.createShift = false
    },
    onShiftSelected (shift) {
      this.selectedShift = shift
      this.createShift = true
    }
  }
}
</script>

<style>
</style>
