class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.references :user
      t.string :name
      t.string :address
      t.string :vat_label
      t.string :vat
      t.timestamps
    end
  end
end
