class DaySerializer
  include FastJsonapi::ObjectSerializer
  attribute(:date) { |o| o.date.strftime("%d/%m/%Y") }
  attributes :id,
             :billable,
             :calendar_id,
             :half

end
