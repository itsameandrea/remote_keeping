class AddAdditionalDataToEmployer < ActiveRecord::Migration[5.2]
  def change
    add_column :employers, :invoice_vat_label, :string
    add_column :employers, :invoice_vat_percentage, :integer
    add_column :employers, :invoicing_date, :datetime
    add_column :employers, :day_rate, :integer
  end
end
