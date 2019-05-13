<template>
  <div>
    <h2  v-if="!hideTitle" class="font-hairline mb-6 text-center">Business information</h2>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">Company name</label>
      <input
        v-model="$parent.business.name"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="Company name">
    </div>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">Company address</label>
      <input
        v-model="$parent.business.address"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="Company address">
    </div>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">VAT Label</label>
      <input
        v-model="$parent.business.vatLabel"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="VAT Label (e.g. 'P.iva')">
    </div>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">VAT Number</label>
      <input
        v-model="$parent.business.vat"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="VAT Number">
    </div>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">IBAN Number</label>
      <input
        v-model="$parent.business.iban"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="IBAN Number">
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