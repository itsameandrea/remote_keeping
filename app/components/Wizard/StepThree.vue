<template>
  <div>
    <h2  v-if="!hideTitle" class="font-hairline mb-6 text-center">Employer information</h2>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">Employer name</label>
      <input
        v-model="$parent.employer.name"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="Employer name">
    </div>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">Employer address</label>
      <input
        v-model="$parent.employer.address"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="Employer address">
    </div>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">Employer VAT label</label>
      <input
        v-model="$parent.employer.vatLabel"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="VAT Label (e.g. 'P.iva')">
    </div>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">Employer VAT number</label>
      <input
        v-model="$parent.employer.vat"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="VAT Number">
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