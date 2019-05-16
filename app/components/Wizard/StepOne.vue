<template>
  <div>
    <h2 v-if="!hideTitle" class="font-hairline mb-6 text-center">
      Profile information
    </h2>
    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">Name</label>
      <input
        v-model="$parent.profile.name"
        type="text"
        class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
        placeholder="Name">
    </div>

    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">
        <custom-check-box
          @change="$parent.profile.autoClockIn = !$parent.profile.autoClockIn"
          :value="$parent.profile.autoClockIn" />
        <span class="ml-2">
          Enable auto clock in
        </span>
      </label>
    </div>

    <div class="mb-4">
      <label class="block text-grey-darker text-sm font-bold mb-2">
        <custom-check-box
          @change="$parent.profile.autoInvoicing = !$parent.profile.autoInvoicing"
          :value="$parent.profile.autoInvoicing" />
        <span class="ml-2">
          Enable auto invoicing
        </span>
      </label>
    </div>
  </div>
</template>
<script>
import CustomCheckBox from '@/components/CustomCheckBox'

export default {
  components: {
    CustomCheckBox
  },
  props: {
    hideTitle: {
      type: Boolean,
      default: false
    }
  }
}
</script>
