module Api
  module V1
    class DaysController < ApplicationController

      def index
        if (params['start'] && params['end'])
          startDate = Date.parse params['start']
          endDate = Date.parse params['end']
          days = current_user.calendar.days.between(startDate, endDate)
        end

        send_response days
      end

      private

      def send_response(res)
        render json: DaySerializer.new(res)
      end

      # def business_params
      #   params.permit(:name, :address, :vat_label, :vat, :iban)
      # end

    end
  end
end
