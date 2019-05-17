class Day < ApplicationRecord
  belongs_to :calendar

  scope :between, -> (startDate, endDate) {
    where('date BETWEEN ? AND ?', startDate, endDate)
  }
end
