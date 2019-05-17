class Calendar < ApplicationRecord
  belongs_to :user
  belongs_to :employer
  has_many :days

  # scope :between_dates, -> (startDate, endDate) {
  #   joins(:days).where('days.date BETWEEN ? AND ?', startDate, endDate)
  # }
end
