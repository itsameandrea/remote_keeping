module Api
	module V1
    class ProfilesController < ApplicationController

      def index
        profiles = Profile.all

        send_response profiles
      end

      def show
        profile = Profile.find params[:id]
        send_response profile
      end

      def update
        profile = Profile.find params[:id]
        
        if profile.update_attributes profile_params
          send_response profile
        end
      end

      private

      def send_response(res)
        render json: ProfileSerializer.new(res)
      end

      def profile_params
        params.require('profile').permit(:name, :auth_clock_in, :auto_invoicing)
      end

		end
	end
end
