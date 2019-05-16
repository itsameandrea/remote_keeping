<template>
  <div class="container mx-auto h-full flex flex-col items-center">
    <div class="w-1/2 mb-10">
      <steps :steps="4" :step="step" />
    </div>
    <div class="flex justify-center w-full">
      <div class="w-1/3">
        <div class="border-teal p-8 border-t-12 bg-white mb-6 rounded-lg shadow-lg">
          <step-one v-if="step === 1" />
          <step-two v-if="step === 2" />
          <step-three v-if="step === 3" />
          <step-four v-if="step === 4" />
          <div class="flex items-center justify-center">
            <custom-button
              @click="onNext"
              color="bg-green"
              :icon="step === 4 ? 'fas fa-check' : 'fas fa-arrow-right'">
              {{ step === 4 ? 'Submit' : 'Next' }}
            </custom-button>
          </div>
          <div v-if="step !== 1" class="text-center pt-5">
            <p class="text-grey-dark text-sm">
              Not a great time?
              <span @click="onSkip" class="no-underline text-blue font-bold cursor-pointer">
                Skip for now
              </span>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CustomButton from '@/components/CustomButton'
import Steps from '@/components/Steps'
import StepOne from '@/components/Wizard/StepOne'
import StepTwo from '@/components/Wizard/StepTwo'
import StepThree from '@/components/Wizard/StepThree'
import StepFour from '@/components/Wizard/StepFour'

export default {
  components: {
    CustomButton,
    Steps,
    StepOne,
    StepTwo,
    StepThree,
    StepFour
  },
  data () {
    return {
      step: 1,
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
  async mounted () {
    await this.$store.dispatch('users/LOAD_RELATIONSHIPS')
  },
  computed: {
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
    onNext () {
      if (this.step === 1) {
        this.step++
      } else if (this.step < 4) {
        this.step++
      } else {
        // UPDATE PROFILE
        this.$emit('update', {
          profile: this.profile,
          business: this.business,
          employer: this.employer
        })

        localStorage.removeItem('firstLogin')
      }
    },
    onSkip () {
      if (step < 4) {
        this.step++
      } else {
        localStorage.removeItem('firstLogin')
        this.$router.push('/')
      }
    }
  }
}
</script>

<style>
</style>
