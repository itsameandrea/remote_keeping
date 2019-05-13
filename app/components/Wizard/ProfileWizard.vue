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
      user: {
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
  mounted () {
    const profile = this.$store.getters['profiles/profile']
    const business = this.$store.getters['businesses/business']
    const employer = this.$store.getters['employers/employer']

    // this.user.name = profile.attributes.name
    // this.user.autoClockIn = profile.attributes.autoClockIn
    // this.user.autoInvoicing = profile.attributes.autoInvoicing
  },
  methods: {
    onNext () {
      if (this.step === 1) {
        this.step++
      } else if (this.step < 4) {
        this.step++
      } else {
        // UPDATE PROFILE
        localStorage.removeItem('firstLogin')
        this.$router.push('/')
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
