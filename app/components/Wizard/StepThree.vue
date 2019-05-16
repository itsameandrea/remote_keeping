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
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">VAT label on the invoice</label>
      <input
        v-model="$parent.employer.invoiceVatLabel"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="e.g. Reverse VAT*">
    </div>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">VAT %</label>
      <input
        v-model="$parent.employer.invoiceVatPercentage"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="e.g. 21%">
    </div>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">First invoice</label>
      <flat-pickr
        :config="pickerConfig"
        class="w-full shadow appearance-none border rounded mb-3 py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        v-model="$parent.employer.invoicingDate"
        placeholder="Pick a date"></flat-pickr>
      <small class="text-grey-dark" v-if="$parent.employer.invoicingDate">
        {{ $parent.employer.name }} will be invoiced every {{ [$parent.employer.invoicingDate, 'DD/MM/YYYY', 'DD-MM-YYYY'] | moment('Do') }} of the month
      </small>
    </div>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">Day rate</label>
      <input
        v-model="$parent.employer.dayRate"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="Day rate">
    </div>
  </div>
</template>
<script>
import flatPickr from 'vue-flatpickr-component';
import 'flatpickr/dist/flatpickr.css';

export default {
  props: {
    hideTitle: {
      type: Boolean,
      default: false
    }
  },
  components: {
    flatPickr
  },
  data () {
    return {
      pickerConfig: {
        dateFormat: 'd/m/Y'
      }
    }
  }
}
</script>
