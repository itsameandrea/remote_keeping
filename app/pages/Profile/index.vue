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
    async onUpdate ({ profile, business, employer }) {
      await this.$store.dispatch('profiles/UPDATE_PROFILE', profile)
      await this.$store.dispatch('businesses/UPDATE_BUSINESS', business)
      await this.$store.dispatch('employers/UPDATE_EMPLOYER', employer)
    }
  }
}
</script>

<style>
</style>
