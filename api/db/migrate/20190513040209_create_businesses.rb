class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.references :user
      t.string :name
      t.string :address
      t.string :vat_label
      t.string :vat
      t.string :iban
      t.timestamps
    end
  end
end
