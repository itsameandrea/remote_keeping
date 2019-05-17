namespace :calendar do
  desc "TODO"
  task update_invoice: :environment do
    users = User.includes([:profile, :calendar, :employer]).where(profiles: { auto_invoicing: true })
    users.each do |user|
      employer = user.employer
      calendar = user.calendar

      day = Day.find_or_create_by(date: Date.today.strftime('%d/%m/%Y')) do |day|
        day.billable = true
        day.half = false
        day.calendar = calendar
      end
    end
  end
end
