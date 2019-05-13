class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :name
      t.boolean :auto_clock_in
      t.boolean :auto_invoicing
      t.timestamps
    end
  end
end
