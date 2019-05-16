class EmployerSerializer
  include FastJsonapi::ObjectSerializer
  attribute(:invoicing_date) { |o| o.invoicing_date.strftime("%d/%m/%Y")}
  attributes :id,
    :name,
    :address,
    :vat_label,
    :vat,
    :invoice_vat_label,
    :invoice_vat_percentage,
    :day_rate

end
