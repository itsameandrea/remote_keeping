class Calendar < ApplicationRecord
  belongs_to :user
  belongs_to :employer
  has_many :days
end
