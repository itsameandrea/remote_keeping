module Api
	module V1
    class BusinessesController < ApplicationController

      def index
        businesses = Business.all

        send_response businesses
      end

      def show
        business = Business.find params[:id]
        send_response business
      end

      def update
        business = Business.find params[:id]

        if business.update_attributes business_params
          send_response business
        end
      end

      private

      def send_response(res)
        render json: BusinessSerializer.new(res)
      end

      def business_params
        params.permit(:name, :address, :vat_label, :vat, :iban)
      end

		end
	end
end
