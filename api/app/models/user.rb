class User < ApplicationRecord

	thread_mattr_accessor :current

	has_secure_password
	validates :email, uniqueness: { case_sensitive: false }, presence: true

	has_one :profile, dependent: :destroy
	has_one :business, dependent: :destroy
	has_one :employer, dependent: :destroy
	has_one :calendar, dependent: :destroy

	after_create :create_profile, :create_business, :create_employer, :create_calendar

	def create_profile
		Profile.create user_id: id
	end

	def create_business
		Business.create user_id: id
	end

	def create_employer
		Employer.create user_id: id
	end

	def create_calendar
		Calendar.create user_id: id, employer_id: employer_id
	end

end
