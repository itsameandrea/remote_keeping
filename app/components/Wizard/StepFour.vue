<template>
  <div>
    <h2  v-if="!hideTitle" class="font-hairline mb-6 text-center">Invoice information</h2>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">VAT Label</label>
      <input
        v-model="$parent.invoice.vatLabel"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="VAT Label (e.g. reverse charge VAT)">
    </div>

    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">VAT %</label>
      <input
        v-model="$parent.invoice.vatPercentage"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="VAT %">
    </div>
  </div>
</template>
<script>
export default {
  props: {
    hideTitle: {
      type: Boolean,
      default: false
    }
  }
}
</script>