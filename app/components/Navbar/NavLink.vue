<template>
  <nuxt-link v-if="to" :to="to" class="relative text-white hover:bg-smoke-lightest h-full px-3 flex items-center cursor-pointer no-underline">
    <slot></slot>
  </nuxt-link>
  <span
    v-else
    @click="$emit('click')"
    class="relative text-white hover:bg-smoke-lightest h-full px-3 flex items-center cursor-pointer no-underline">
    <slot></slot>
  </span>
</template>

<script>
export default {
  props: {
    to: String
  }
}
</script>

<style>

</style>