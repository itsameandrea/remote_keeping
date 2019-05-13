<template>
  <div>
    <div class="flex justify-center">
      <custom-button 
        @click="weekView = true" 
        :color="weekView? 'bg-green-dark' : 'bg-grey-light'">
          Week
      </custom-button>
      <span class="mx-4"></span>
      <custom-button 
        @click="weekView = false" 
        :color="weekView? 'bg-grey' : 'bg-green-dark'">
          Month
      </custom-button>
    </div>
    <div v-if="weekView">
      <div class="py-6 md:flex justify-center items-center relative">
        <span @click="onPrev" class='w-6 h-6 bg-blue text-white rounded-full flex justify-center items-center content-center cursor-pointer'>
          <i class="fas fa-chevron-left"></i>
        </span>
        <span class="px-10 text-center"> {{ weekStart }} - {{ weekEnd }} </span>
        <span @click="onNext" class='w-6 h-6 bg-blue text-white rounded-full flex justify-center items-center content-center cursor-pointer'>
          <i class="fas fa-chevron-right"></i>
        </span>
      </div>
      <div class="px-3">
        <div class="md:flex justify-between my-3">
          <div v-for="(day, index) in week" :key="index" class="text-center w-full">
            {{ day }}
          </div>
        </div>
        <div>
          <div class="bg-teal-light py-2 pl-4 shadow-md rounded-lg">
            
          </div>
          <div class="md:flex justify-between">
            <span  
              v-for="day in week" 
              :key="day"
              :class="`list-reset w-full px-1 ${getBackground(day)} rounded-lg my-2 mx-1 px-2 min-h-15`">
            </span>
          </div>
        </div>
      </div>
    </div>
    <div v-else>
      <div class="py-6 md:flex justify-center items-center relative">
        <span @click="onPrev" class='w-6 h-6 bg-blue text-white rounded-full flex justify-center items-center content-center cursor-pointer'>
          <i class="fas fa-chevron-left"></i>
        </span>
        <span class="px-10 text-center"> {{ currentMonth }} </span>
        <span @click="onNext" class='w-6 h-6 bg-blue text-white rounded-full flex justify-center items-center content-center cursor-pointer'>
          <i class="fas fa-chevron-right"></i>
        </span>
      </div>
      <div class="px-3">
        <div class="md:flex justify-between my-3">
          <div v-for="day in days" :key="day" class="text-center w-full">
            {{ day }}
          </div>
        </div>
        <div>
          <div class="bg-teal py-2 pl-4 shadow-md rounded-lg">
            
          </div>
          <div class="md:flex justify-between">
            <ul class="list-reset w-full" v-for="day in days" :key="day">
              <li
                v-for="item in itemsByDay(day)"
                :key="item"
                :class="`text-center my-3 px-1 ${getBackground(item)} rounded-lg my-2 mx-1 px-2 min-h-10`">
                <span class="flex flex-col w-full text-sm rounded-lg py-2">
                  <span class="font-semibold"> {{ item }} </span>
                </span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CustomButton from './CustomButton'

export default {
  components: {
    CustomButton
  },
  props: {
    teams: Array,
    shifts: Array
  },
  data () {
    return {
      weekView: true,
      dateFormat: 'DD/MM/YYYY',
      monthFormat: 'MMMM YYYY',
      days: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
      weekStart: this.$moment().startOf('isoweek').format('DD/MM/YYYY'),
      currentMonth: this.$moment().format('MMMM YYYY')
    }
  },
  computed: {
    weekEnd () {
      return this.$moment(this.weekStart, this.dateFormat).add(6, 'days').format(this.dateFormat)
    },
    week () {
      const now = this.$moment(this.weekStart, this.dateFormat)
      const end = this.$moment(this.weekEnd, this.dateFormat)
      const dates = []

      while (now.isSameOrBefore(end)) {
          dates.push(now.format('DD/MM/YYYY'))
          now.add(1, 'days')
      }
      return dates
    },
    wholeMonth () {      
      const start = this.$moment(this.currentMonth, this.monthFormat).startOf('month')
      const end = this.$moment(this.currentMonth, this.monthFormat).endOf('month')
      const dates = []

      while (start.isSameOrBefore(end)) {
        dates.push(start.format('DD/MM/YYYY'))
        start.add(1, 'days')
      }

      return dates
    }
  },
  methods: {
    onNext () {
      if (this.weekView)
        this.weekStart = this.$moment(this.weekStart, this.dateFormat).add(7, 'days').format(this.dateFormat)
      else
        this.currentMonth = this.$moment(this.currentMonth, this.monthFormat).add(1, 'month').format(this.monthFormat)
    },
    onPrev () {
      if (this.weekView)
        this.weekStart = this.$moment(this.weekStart, this.dateFormat).subtract(7, 'days').format(this.dateFormat)
      else
        this.currentMonth = this.$moment(this.currentMonth, this.monthFormat).subtract(1, 'month').format(this.monthFormat)
    },
    dailyShiftsByTeam (day, team) {      
      const shifts = this.shifts.filter((shift) => {
        const formattedShift = this.$moment(shift.date, 'MM/DD/YYYY')
        const formattedDay = this.$moment(day, this.dateFormat).format('MM/DD/YYYY')
        return formattedShift.isSame(formattedDay) && shift.team === team.name
      })
      return shifts
    },
    itemsByDay (day) {
      const days = this.wholeMonth.filter((date) => {
        return this.$moment(date, 'DD/MM/YYYY').format('dddd') === day
      })

      let firstOfTheArray = this.$moment(days[0], 'DD/MM/YYYY')
      let firstOfTheMonth = this.$moment(this.currentMonth, this.monthFormat).startOf('month')
      
      // firstOfTheArray = this.$moment(firstOfTheArray, 'DD/MM/YYYY')
      // firstOfTheMonth = this.$moment(firstOfTheMonth, 'DD/MM/YYYY')

      if (firstOfTheArray.format('w') > firstOfTheMonth.format('w'))
        days.unshift(firstOfTheArray.subtract(7, 'days').format('DD/MM/YYYY'))

      return days
    },
    getBackground (day) {
      const dayMoment = this.$moment(day, 'DD/MM/YYYY').startOf('day')
      const today = this.$moment().startOf('day')

      if (dayMoment.isSame(today, 'day')) {
        console.log('Today')
        return 'bg-grey-light border-4 border-blue'
      }
        

      if (this.$moment(day, 'DD/MM/YYYY').isSame(this.currentMonth, 'month'))
        return 'bg-grey-light'
      
      return 'bg-grey-lighter text-grey'
    }
  }
}
</script>