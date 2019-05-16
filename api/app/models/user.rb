class User < ApplicationRecord

	thread_mattr_accessor :current

	has_secure_password
	validates :email, uniqueness: { case_sensitive: false }, presence: true

	has_one :profile
	has_one :business
	has_one :employer
	has_one :calendar

	after_create :create_profile, :create_business, :create_employer

	def create_profile
		Profile.create user_id: id
	end

	def create_business
		Business.create user_id: id
	end

	def create_employer
		Employer.create user_id: id
	end

end
