class CreateCalendarTable < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.references :user
      t.references :employer
    end

    create_table :days do |t|
      t.references :calendar
      t.date :date
      t.boolean :billable
      t.boolean :half
    end

    add_reference :users, :calendar
    add_reference :employers, :calendar
  end
end
