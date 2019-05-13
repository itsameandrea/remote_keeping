<template>
  <profile-wizard
    v-if="showWizard"
    @update="onUpdate" />
  <profile-form
    v-else
    @update="onUpdate" />
</template>

<script>
import ProfileWizard from '@/components/Wizard/ProfileWizard'
import ProfileForm from '@/components/ProfileForm'

export default {
  components: {
    ProfileWizard,
    ProfileForm
  },
  computed: {
    initialSetup () {
      return !!this.$route.query.initial
    },
    firstLogin () {
      return localStorage.getItem('firstLogin')
    },
    showWizard () {
      return this.initialSetup && this.firstLogin
    }
  },
  methods: {
    onUpdate ({ profile, business, employer }) {
      this.$store.dispatch('profiles/UPDATE_PROFILE', profile)
      this.$store.dispatch('businesses/UPDATE_BUSINESS', profile)
      this.$store.dispatch('employers/UPDATE_EMPLOYER', profile)
    }
  }
}
</script>

<style>
</style>
