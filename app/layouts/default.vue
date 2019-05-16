<template>
  <div class="bg-grey-lightest h-screen">
  	<navbar />
    <nuxt />
  </div>
</template>
<script>
import Navbar from '@/components/Navbar'

export default {
  components: {
    Navbar
  },
  async mounted () {
    if (this.$auth.user) {
      await this.$store.dispatch('users/LOAD_RELATIONSHIPS')
    }
  }
}
</script>

<style>
  .nuxt-link-exact-active::after {
    height: 3px;
    background: white;
    position: absolute;
    bottom: 0;
    left: 0;
    content: "";
    width: 100%;
  }
</style>
