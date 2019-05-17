<template>
  <div class="containers flex flex justify-center">
    <div class="border-teal p-0 pb-5 border-t-12 bg-white mb-6 rounded-lg shadow-lg">
      <ul class="list-reset flex border-b w-full">
        <li class="-mb-px mr-1" v-for="tab in tabs" :key="tab.text">
          <a
            @click="activateTab(tab)"
            :class="`bg-white inline-block py-4 px-4 text-blue-dark font-semibold ${tab.isActive ? activeClass : ''}`">
            {{ tab.text }}
          </a>
        </li>
      </ul>
      <div class="container flex pt-5 justify-center">
        <step-one v-if="selectedTab.step === 1" :hideTitle="true" />
        <step-two v-if="selectedTab.step === 2" :hideTitle="true" />
        <step-three v-if="selectedTab.step === 3" :hideTitle="true" />
      </div>
      <div class="flex items-center my-4 justify-center">
        <custom-button
          @click="onSave"
          color="bg-green"
          icon="fas fa-check">
            Save
        </custom-button>
      </div>
    </div>
  </div>
</template>

<script>
import CustomButton from '@/components/CustomButton'
import StepOne from '@/components/Wizard/StepOne'
import StepTwo from '@/components/Wizard/StepTwo'
import StepThree from '@/components/Wizard/StepThree'

export default {
  components: {
    CustomButton,
    StepOne,
    StepTwo,
    StepThree,
  },
  data () {
    return {
      activeClass: 'border-l border-t border-r rounded-t',
      tabs: [
        {
          text: 'Profile information',
          isActive: true,
          step: 1
        },
        {
          text: 'Business information',
          isActive: false,
          step: 2
        },
        {
          text: 'Employer information',
          isActive: false,
          step: 3
        }
      ],
      profile: {
        name: '',
        autoClockIn: false,
        autoInvoicing: false
      },
      business: {
        name: '',
        address: '',
        vatLabel: '',
        vat: '',
        iban: ''
      },
      employer: {
        name: '',
        address: '',
        vatLabel: '',
        vat: ''
      },
      invoice: {
        vatLabel: '',
        vatPercentage: ''
      }
    }
  },
  computed: {
    selectedTab () {
      return this.tabs.find((tab) => tab.isActive)
    },
    profileData () {
      return this.$store.getters['profiles/profile']
    },
    businessData () {
      return this.$store.getters['businesses/business']
    },
    employerData () {
      return this.$store.getters['employers/employer']
    }
  },
  watch: {
    profileData (value) {
      if (value) {
        this.profile = { ...value.attributes }
      }
    },
    businessData (value) {
      if (value) {
        this.business = { ...value.attributes }
      }
    },
    employerData (value) {
      if (value) {
        this.employer = { ...value.attributes }
      }
    },
  },
  methods: {
    activateTab (tab) {
      this.tabs.forEach((t) => t.isActive = false)
      tab.isActive = true
    },
    onSave () {
      this.$emit('update', {
        profile: this.profile,
        business: this.business,
        employer: this.employer
      })
    }
  }
}
</script>

<style>

</style>
