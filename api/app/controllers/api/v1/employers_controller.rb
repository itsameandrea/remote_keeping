module Api
	module V1
    class EmployersController < ApplicationController
      def index
        employers = Employer.all

        send_response employers
      end

      def show
        employer = Employer.find params[:id]
        send_response employer
      end

      def update
        employer = Employer.find params[:id]

        if employer.update_attributes employer_params
          send_response employer
        end
      end

      private

      def send_response(res)
        render json: EmployerSerializer.new(res)
      end

      def employer_params
        params.permit(
          :name,
          :address,
          :vat_label,
          :vat,
          :invoice_vat_label,
          :invoice_vat_percentage,
          :invoicing_date,
          :day_rate
        )
      end
		end
	end
end
